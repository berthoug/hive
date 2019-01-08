-- MySQL dump 10.13  Distrib 5.5.25, for osx10.6 (i386)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.5.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `BUCKETING_COLS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `BUCKETING_COLS` (
  `SD_ID` bigint(20) NOT NULL,
  `BUCKET_COL_NAME` varchar(256) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`SD_ID`,`INTEGER_IDX`),
  KEY `BUCKETING_COLS_N49` (`SD_ID`),
  CONSTRAINT `BCK_SD_FK` FOREIGN KEY (`SD_ID`) REFERENCES `SDS` (`SD_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CDS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `CDS` (
  `CD_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`CD_ID`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `COLUMNS_V2`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `COLUMNS_V2` (
  `CD_ID` bigint(20) NOT NULL,
  `COMMENT` varchar(256) CHARACTER SET latin1 DEFAULT NULL,
  `COLUMN_NAME` varchar(767) CHARACTER SET latin1 NOT NULL,
  `TYPE_NAME` MEDIUMTEXT DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`CD_ID`,`COLUMN_NAME`),
  KEY `COLUMNS_V2_N49` (`CD_ID`),
  CONSTRAINT `COLUMN_CDS_FK` FOREIGN KEY (`CD_ID`) REFERENCES `CDS` (`CD_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DATABASE_PARAMS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `DATABASE_PARAMS` (
  `DB_ID` bigint(20) NOT NULL,
  `PARAM_KEY` varchar(180) CHARACTER SET latin1 NOT NULL,
  `PARAM_VALUE` varchar(4000) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`DB_ID`,`PARAM_KEY`),
  KEY `DATABASE_PARAMS_N49` (`DB_ID`),
  CONSTRAINT `DB_PARAMS_DBS_FK` FOREIGN KEY (`DB_ID`) REFERENCES `DBS` (`DB_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SERDES`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `SERDES` (
  `SERDE_ID` bigint(20) NOT NULL,
  `NAME` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `SLIB` varchar(4000) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`SERDE_ID`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SDS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `SDS` (
  `SD_ID` bigint(20) NOT NULL,
  `CD_ID` bigint(20) DEFAULT NULL,
  `INPUT_FORMAT` varchar(4000) CHARACTER SET latin1 DEFAULT NULL,
  `IS_COMPRESSED` bit(1) NOT NULL,
  `IS_STOREDASSUBDIRECTORIES` bit(1) NOT NULL,
  `LOCATION` varchar(4000) CHARACTER SET latin1 DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NUM_BUCKETS` int(11) NOT NULL,
  `OUTPUT_FORMAT` varchar(4000) CHARACTER SET latin1 DEFAULT NULL,
  `PARENT_ID` bigint(20) DEFAULT NULL,
  `PARTITION_ID` bigint(20) DEFAULT NULL,
  `SERDE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SD_ID`),
  KEY `SDS_N49` (`SERDE_ID`),
  KEY `SDS_N50` (`CD_ID`),
  CONSTRAINT `SDS_FK1` FOREIGN KEY (`CD_ID`) REFERENCES `CDS` (`CD_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SDS_FK2` FOREIGN KEY (`SERDE_ID`) REFERENCES `SERDES` (`SERDE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `INODE_SDS_FK` FOREIGN KEY (`PARTITION_ID`, `PARENT_ID`, `NAME`) REFERENCES `hops`.`hdfs_inodes` (`partition_id`, `parent_id`, `name`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DBS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `DBS` (
  `DB_ID` bigint(20) NOT NULL,
  `DESC` varchar(4000) CHARACTER SET latin1 DEFAULT NULL,
  `NAME` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `OWNER_NAME` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `OWNER_TYPE` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `SD_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DB_ID`),
  UNIQUE KEY `UNIQUE_DATABASE` (`NAME`),
  KEY `DBS_N49` (`SD_ID`),
  CONSTRAINT `DB_SD_FK` FOREIGN KEY (`SD_ID`) REFERENCES `SDS` (`SD_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DB_PRIVS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `DB_PRIVS` (
  `DB_GRANT_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `DB_ID` bigint(20) DEFAULT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `DB_PRIV` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`DB_GRANT_ID`),
  UNIQUE KEY `DBPRIVILEGEINDEX` (`DB_ID`,`PRINCIPAL_NAME`,`PRINCIPAL_TYPE`,`DB_PRIV`,`GRANTOR`,`GRANTOR_TYPE`),
  KEY `DB_PRIVS_N49` (`DB_ID`),
  CONSTRAINT `DB_PRIVS_DBS_FK` FOREIGN KEY (`DB_ID`) REFERENCES `DBS` (`DB_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GLOBAL_PRIVS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `GLOBAL_PRIVS` (
  `USER_GRANT_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `USER_PRIV` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`USER_GRANT_ID`),
  UNIQUE KEY `GLOBALPRIVILEGEINDEX` (`PRINCIPAL_NAME`,`PRINCIPAL_TYPE`,`USER_PRIV`,`GRANTOR`,`GRANTOR_TYPE`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDXS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `IDXS` (
  `INDEX_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `DEFERRED_REBUILD` bit(1) NOT NULL,
  `INDEX_HANDLER_CLASS` varchar(4000) CHARACTER SET latin1 DEFAULT NULL,
  `INDEX_NAME` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `INDEX_TBL_ID` bigint(20) DEFAULT NULL,
  `LAST_ACCESS_TIME` int(11) NOT NULL,
  `ORIG_TBL_ID` bigint(20) DEFAULT NULL,
  `SD_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`INDEX_ID`),
  UNIQUE KEY `UNIQUEINDEX` (`INDEX_NAME`,`ORIG_TBL_ID`),
  KEY `IDXS_N51` (`SD_ID`),
  KEY `IDXS_N50` (`INDEX_TBL_ID`),
  KEY `IDXS_N49` (`ORIG_TBL_ID`),
  CONSTRAINT `IDX_TBL_IDX_FK` FOREIGN KEY (`INDEX_TBL_ID`) REFERENCES `TBLS` (`TBL_ID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `TBL_IDX_FK` FOREIGN KEY (`ORIG_TBL_ID`) REFERENCES `TBLS` (`TBL_ID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `SD_IDX_FK` FOREIGN KEY (`SD_ID`) REFERENCES `SDS` (`SD_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `INDEX_PARAMS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `INDEX_PARAMS` (
  `INDEX_ID` bigint(20) NOT NULL,
  `PARAM_KEY` varchar(256) CHARACTER SET latin1 NOT NULL,
  `PARAM_VALUE` varchar(4000) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`INDEX_ID`,`PARAM_KEY`),
  KEY `INDEX_PARAMS_N49` (`INDEX_ID`),
  CONSTRAINT `IDX_PARAMS_ID_FK` FOREIGN KEY (`INDEX_ID`) REFERENCES `IDXS` (`INDEX_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NUCLEUS_TABLES`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `NUCLEUS_TABLES` (
  `CLASS_NAME` varchar(128) CHARACTER SET latin1 NOT NULL,
  `TABLE_NAME` varchar(128) CHARACTER SET latin1 NOT NULL,
  `TYPE` varchar(4) CHARACTER SET latin1 NOT NULL,
  `OWNER` varchar(2) CHARACTER SET latin1 NOT NULL,
  `VERSION` varchar(20) CHARACTER SET latin1 NOT NULL,
  `INTERFACE_NAME` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`CLASS_NAME`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PARTITIONS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `PARTITIONS` (
  `PART_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `LAST_ACCESS_TIME` int(11) NOT NULL,
  `PART_NAME` varchar(767) CHARACTER SET latin1 DEFAULT NULL,
  `SD_ID` bigint(20) DEFAULT NULL,
  `TBL_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PART_ID`),
  UNIQUE KEY `UNIQUEPARTITION` (`PART_NAME`,`TBL_ID`),
  KEY `PARTITIONS_N49` (`TBL_ID`),
  KEY `PARTITIONS_N50` (`SD_ID`),
  CONSTRAINT `PART_TBL_FK` FOREIGN KEY (`TBL_ID`) REFERENCES `TBLS` (`TBL_ID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `PART_SDS_FK` FOREIGN KEY (`SD_ID`) REFERENCES `SDS` (`SD_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PARTITION_EVENTS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `PARTITION_EVENTS` (
  `PART_NAME_ID` bigint(20) NOT NULL,
  `DB_NAME` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `EVENT_TIME` bigint(20) NOT NULL,
  `EVENT_TYPE` int(11) NOT NULL,
  `PARTITION_NAME` varchar(767) CHARACTER SET latin1 DEFAULT NULL,
  `TBL_NAME` varchar(256) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`PART_NAME_ID`),
  KEY `PARTITIONEVENTINDEX` (`PARTITION_NAME`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PARTITION_KEYS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `PARTITION_KEYS` (
  `TBL_ID` bigint(20) NOT NULL,
  `PKEY_COMMENT` varchar(4000) CHARACTER SET latin1 DEFAULT NULL,
  `PKEY_NAME` varchar(128) CHARACTER SET latin1 NOT NULL,
  `PKEY_TYPE` varchar(767) CHARACTER SET latin1 NOT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`TBL_ID`,`PKEY_NAME`),
  KEY `PARTITION_KEYS_N49` (`TBL_ID`),
  CONSTRAINT `PKEY_TBL_FK` FOREIGN KEY (`TBL_ID`) REFERENCES `TBLS` (`TBL_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PARTITION_KEY_VALS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `PARTITION_KEY_VALS` (
  `PART_ID` bigint(20) NOT NULL,
  `PART_KEY_VAL` varchar(256) CHARACTER SET latin1 DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`PART_ID`,`INTEGER_IDX`),
  KEY `PARTITION_KEY_VALS_N49` (`PART_ID`),
  CONSTRAINT `PART_KEY_VAL_PART_FK` FOREIGN KEY (`PART_ID`) REFERENCES `PARTITIONS` (`PART_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PARTITION_PARAMS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `PARTITION_PARAMS` (
  `PART_ID` bigint(20) NOT NULL,
  `PARAM_KEY` varchar(256) CHARACTER SET latin1 NOT NULL,
  `PARAM_VALUE` varchar(4000) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`PART_ID`,`PARAM_KEY`),
  KEY `PARTITION_PARAMS_N49` (`PART_ID`),
  CONSTRAINT `PART_PARAMS_PART_KF` FOREIGN KEY (`PART_ID`) REFERENCES `PARTITIONS` (`PART_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PART_COL_PRIVS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `PART_COL_PRIVS` (
  `PART_COLUMN_GRANT_ID` bigint(20) NOT NULL,
  `COLUMN_NAME` varchar(767) CHARACTER SET latin1 DEFAULT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `PART_ID` bigint(20) DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `PART_COL_PRIV` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`PART_COLUMN_GRANT_ID`),
  KEY `PART_COL_PRIVS_N49` (`PART_ID`),
  KEY `PARTITIONCOLUMNPRIVILEGEINDEX` (`PART_ID`,`COLUMN_NAME`,`PRINCIPAL_NAME`,`PRINCIPAL_TYPE`,`PART_COL_PRIV`,`GRANTOR`,`GRANTOR_TYPE`),
  CONSTRAINT `PART_PRIVS_PART_FK` FOREIGN KEY (`PART_ID`) REFERENCES `PARTITIONS` (`PART_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PART_PRIVS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `PART_PRIVS` (
  `PART_GRANT_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `PART_ID` bigint(20) DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `PART_PRIV` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`PART_GRANT_ID`),
  KEY `PARTPRIVILEGEINDEX` (`PART_ID`,`PRINCIPAL_NAME`,`PRINCIPAL_TYPE`,`PART_PRIV`,`GRANTOR`,`GRANTOR_TYPE`),
  KEY `PART_PRIVS_N49` (`PART_ID`),
  CONSTRAINT `PART_PRIVS_PART_FK` FOREIGN KEY (`PART_ID`) REFERENCES `PARTITIONS` (`PART_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ROLES`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `ROLES` (
  `ROLE_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `OWNER_NAME` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `ROLE_NAME` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`),
  UNIQUE KEY `ROLEENTITYINDEX` (`ROLE_NAME`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ROLE_MAP`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `ROLE_MAP` (
  `ROLE_GRANT_ID` bigint(20) NOT NULL,
  `ADD_TIME` int(11) NOT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `ROLE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ROLE_GRANT_ID`),
  UNIQUE KEY `USERROLEMAPINDEX` (`PRINCIPAL_NAME`,`ROLE_ID`,`GRANTOR`,`GRANTOR_TYPE`),
  KEY `ROLE_MAP_N49` (`ROLE_ID`),
  CONSTRAINT `ROLE_MAP_FK1` FOREIGN KEY (`ROLE_ID`) REFERENCES `ROLES` (`ROLE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `SD_PARAMS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `SD_PARAMS` (
  `SD_ID` bigint(20) NOT NULL,
  `PARAM_KEY` varchar(256) CHARACTER SET latin1 NOT NULL,
  `PARAM_VALUE` MEDIUMTEXT CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`SD_ID`,`PARAM_KEY`),
  KEY `SD_PARAMS_N49` (`SD_ID`),
  CONSTRAINT `PARAMS_SD_FK` FOREIGN KEY (`SD_ID`) REFERENCES `SDS` (`SD_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SEQUENCE_TABLE`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `SEQUENCE_TABLE` (
  `SEQUENCE_NAME` varchar(255) CHARACTER SET latin1 NOT NULL,
  `NEXT_VAL` bigint(20) NOT NULL,
  PRIMARY KEY (`SEQUENCE_NAME`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `SERDE_PARAMS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `SERDE_PARAMS` (
  `SERDE_ID` bigint(20) NOT NULL,
  `PARAM_KEY` varchar(256) CHARACTER SET latin1 NOT NULL,
  `PARAM_VALUE` MEDIUMTEXT CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`SERDE_ID`,`PARAM_KEY`),
  KEY `SERDE_PARAMS_N49` (`SERDE_ID`),
  CONSTRAINT `SERDE_PARAMS_FK` FOREIGN KEY (`SERDE_ID`) REFERENCES `SERDES` (`SERDE_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SKEWED_COL_NAMES`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `SKEWED_COL_NAMES` (
  `SD_ID` bigint(20) NOT NULL,
  `SKEWED_COL_NAME` varchar(256) CHARACTER SET latin1 DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`SD_ID`,`INTEGER_IDX`),
  KEY `SKEWED_COL_NAMES_N49` (`SD_ID`),
  CONSTRAINT `SK_COL_NAME_SDS_FK` FOREIGN KEY (`SD_ID`) REFERENCES `SDS` (`SD_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SKEWED_COL_VALUE_LOC_MAP`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `SKEWED_COL_VALUE_LOC_MAP` (
  `SD_ID` bigint(20) NOT NULL,
  `STRING_LIST_ID_KID` bigint(20) NOT NULL,
  `LOCATION` varchar(4000) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`SD_ID`,`STRING_LIST_ID_KID`),
  KEY `SKEWED_COL_VALUE_LOC_MAP_N49` (`STRING_LIST_ID_KID`),
  KEY `SKEWED_COL_VALUE_LOC_MAP_N50` (`SD_ID`),
  CONSTRAINT `SKEWED_COL_VALUE_LOC_MAP_FK1` FOREIGN KEY (`STRING_LIST_ID_KID`) REFERENCES `SKEWED_STRING_LIST` (`STRING_LIST_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SKVAL_SD_FK` FOREIGN KEY (`SD_ID`) REFERENCES `SDS` (`SD_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SKEWED_STRING_LIST`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `SKEWED_STRING_LIST` (
  `STRING_LIST_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`STRING_LIST_ID`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SKEWED_STRING_LIST_VALUES`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `SKEWED_STRING_LIST_VALUES` (
  `STRING_LIST_ID` bigint(20) NOT NULL,
  `STRING_LIST_VALUE` varchar(256) CHARACTER SET latin1 DEFAULT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`STRING_LIST_ID`,`INTEGER_IDX`),
  KEY `SKEWED_STRING_LIST_VALUES_N49` (`STRING_LIST_ID`),
  CONSTRAINT `SKEWED_STRING_LIST_VALUES_FK` FOREIGN KEY (`STRING_LIST_ID`) REFERENCES `SKEWED_STRING_LIST` (`STRING_LIST_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SKEWED_VALUES`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `SKEWED_VALUES` (
  `SD_ID_OID` bigint(20) NOT NULL,
  `STRING_LIST_ID_EID` bigint(20) NOT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`SD_ID_OID`,`INTEGER_IDX`),
  KEY `SKEWED_VALUES_N50` (`SD_ID_OID`),
  KEY `SKEWED_VALUES_N49` (`STRING_LIST_ID_EID`),
  CONSTRAINT `SKEWED_VALUES_FK2` FOREIGN KEY (`STRING_LIST_ID_EID`) REFERENCES `SKEWED_STRING_LIST` (`STRING_LIST_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `SKEWED_VALUES_FK1` FOREIGN KEY (`SD_ID_OID`) REFERENCES `SDS` (`SD_ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SORT_COLS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `SORT_COLS` (
  `SD_ID` bigint(20) NOT NULL,
  `COLUMN_NAME` varchar(767) CHARACTER SET latin1 DEFAULT NULL,
  `ORDER` int(11) NOT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`SD_ID`,`INTEGER_IDX`),
  KEY `SORT_COLS_N49` (`SD_ID`),
  CONSTRAINT `SORT_SD_FK` FOREIGN KEY (`SD_ID`) REFERENCES `SDS` (`SD_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TABLE_PARAMS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `TABLE_PARAMS` (
  `TBL_ID` bigint(20) NOT NULL,
  `PARAM_KEY` varchar(256) CHARACTER SET latin1 NOT NULL,
  `PARAM_VALUE` MEDIUMTEXT CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`TBL_ID`,`PARAM_KEY`),
  KEY `TABLE_PARAMS_N49` (`TBL_ID`),
  CONSTRAINT `PARAM_TBL_FK` FOREIGN KEY (`TBL_ID`) REFERENCES `TBLS` (`TBL_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBLS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `TBLS` (
  `TBL_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `DB_ID` bigint(20) DEFAULT NULL,
  `LAST_ACCESS_TIME` int(11) NOT NULL,
  `OWNER` varchar(767) CHARACTER SET latin1 DEFAULT NULL,
  `RETENTION` int(11) NOT NULL,
  `SD_ID` bigint(20) DEFAULT NULL,
  `TBL_NAME` varchar(256) CHARACTER SET latin1 DEFAULT NULL,
  `TBL_TYPE` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `VIEW_EXPANDED_TEXT` mediumtext,
  `VIEW_ORIGINAL_TEXT` mediumtext,
  `IS_REWRITE_ENABLED` bit(1) NOT NULL,
  PRIMARY KEY (`TBL_ID`),
  UNIQUE KEY `UNIQUETABLE` (`TBL_NAME`,`DB_ID`),
  KEY `TBLS_N50` (`SD_ID`),
  KEY `TBLS_N49` (`DB_ID`),
  CONSTRAINT `TBL_DB_FK` FOREIGN KEY (`DB_ID`) REFERENCES `DBS` (`DB_ID`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `TBL_SD_FK` FOREIGN KEY (`SD_ID`) REFERENCES `SDS` (`SD_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_COL_PRIVS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `TBL_COL_PRIVS` (
  `TBL_COLUMN_GRANT_ID` bigint(20) NOT NULL,
  `COLUMN_NAME` varchar(767) CHARACTER SET latin1 DEFAULT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `TBL_COL_PRIV` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `TBL_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`TBL_COLUMN_GRANT_ID`),
  KEY `TABLECOLUMNPRIVILEGEINDEX` (`TBL_ID`,`COLUMN_NAME`,`PRINCIPAL_NAME`,`PRINCIPAL_TYPE`,`TBL_COL_PRIV`,`GRANTOR`,`GRANTOR_TYPE`),
  KEY `TBL_COL_PRIVS_N49` (`TBL_ID`),
  CONSTRAINT `COL_PRIVS_TBL_FK` FOREIGN KEY (`TBL_ID`) REFERENCES `TBLS` (`TBL_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TBL_PRIVS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `TBL_PRIVS` (
  `TBL_GRANT_ID` bigint(20) NOT NULL,
  `CREATE_TIME` int(11) NOT NULL,
  `GRANT_OPTION` smallint(6) NOT NULL,
  `GRANTOR` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `GRANTOR_TYPE` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `PRINCIPAL_NAME` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `PRINCIPAL_TYPE` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `TBL_PRIV` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `TBL_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`TBL_GRANT_ID`),
  KEY `TBL_PRIVS_N49` (`TBL_ID`),
  KEY `TABLEPRIVILEGEINDEX` (`TBL_ID`,`PRINCIPAL_NAME`,`PRINCIPAL_TYPE`,`TBL_PRIV`,`GRANTOR`,`GRANTOR_TYPE`),
  CONSTRAINT `PRIVS_TBL_FK` FOREIGN KEY (`TBL_ID`) REFERENCES `TBLS` (`TBL_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TAB_COL_STATS`
--
CREATE TABLE IF NOT EXISTS `TAB_COL_STATS` (
 `CS_ID` bigint(20) NOT NULL,
 `DB_NAME` varchar(128) CHARACTER SET latin1 NOT NULL,
 `TABLE_NAME` varchar(256) CHARACTER SET latin1 NOT NULL,
 `COLUMN_NAME` varchar(767) CHARACTER SET latin1 NOT NULL,
 `COLUMN_TYPE` varchar(128) CHARACTER SET latin1 NOT NULL,
 `TBL_ID` bigint(20) NOT NULL,
 `LONG_LOW_VALUE` bigint(20),
 `LONG_HIGH_VALUE` bigint(20),
 `DOUBLE_HIGH_VALUE` double(53,4),
 `DOUBLE_LOW_VALUE` double(53,4),
 `BIG_DECIMAL_LOW_VALUE` varchar(4000) CHARACTER SET latin1,
 `BIG_DECIMAL_HIGH_VALUE` varchar(4000) CHARACTER SET latin1,
 `NUM_NULLS` bigint(20) NOT NULL,
 `NUM_DISTINCTS` bigint(20),
 `AVG_COL_LEN` double(53,4),
 `MAX_COL_LEN` bigint(20),
 `NUM_TRUES` bigint(20),
 `NUM_FALSES` bigint(20),
 `LAST_ANALYZED` bigint(20) NOT NULL,
  PRIMARY KEY (`CS_ID`),
  CONSTRAINT `COL_STATS_TBL_FK` FOREIGN KEY (`TBL_ID`) REFERENCES `TBLS` (`TBL_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

--
-- Table structure for table `PART_COL_STATS`
--
CREATE TABLE IF NOT EXISTS `PART_COL_STATS` (
 `CS_ID` bigint(20) NOT NULL,
 `DB_NAME` varchar(128) CHARACTER SET latin1 NOT NULL,
 `TABLE_NAME` varchar(256) CHARACTER SET latin1 NOT NULL,
 `PARTITION_NAME` varchar(767) CHARACTER SET latin1 NOT NULL,
 `COLUMN_NAME` varchar(767) CHARACTER SET latin1 NOT NULL,
 `COLUMN_TYPE` varchar(128) CHARACTER SET latin1 NOT NULL,
 `PART_ID` bigint(20) NOT NULL,
 `LONG_LOW_VALUE` bigint(20),
 `LONG_HIGH_VALUE` bigint(20),
 `DOUBLE_HIGH_VALUE` double(53,4),
 `DOUBLE_LOW_VALUE` double(53,4),
 `BIG_DECIMAL_LOW_VALUE` varchar(4000) CHARACTER SET latin1,
 `BIG_DECIMAL_HIGH_VALUE` varchar(4000) CHARACTER SET latin1,
 `NUM_NULLS` bigint(20) NOT NULL,
 `NUM_DISTINCTS` bigint(20),
 `AVG_COL_LEN` double(53,4),
 `MAX_COL_LEN` bigint(20),
 `NUM_TRUES` bigint(20),
 `NUM_FALSES` bigint(20),
 `LAST_ANALYZED` bigint(20) NOT NULL,
  PRIMARY KEY (`CS_ID`),
  CONSTRAINT `PART_COL_STATS_PART_FK` FOREIGN KEY (`PART_ID`) REFERENCES `PARTITIONS` (`PART_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

CREATE INDEX PCS_STATS_IDX ON PART_COL_STATS (DB_NAME,TABLE_NAME,COLUMN_NAME,PARTITION_NAME) USING BTREE;

--
-- Table structure for table `TYPES`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `TYPES` (
  `TYPES_ID` bigint(20) NOT NULL,
  `TYPE_NAME` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `TYPE1` varchar(767) CHARACTER SET latin1 DEFAULT NULL,
  `TYPE2` varchar(767) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`TYPES_ID`),
  UNIQUE KEY `UNIQUE_TYPE` (`TYPE_NAME`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TYPE_FIELDS`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `TYPE_FIELDS` (
  `TYPE_NAME` bigint(20) NOT NULL,
  `COMMENT` varchar(256) CHARACTER SET latin1 DEFAULT NULL,
  `FIELD_NAME` varchar(128) CHARACTER SET latin1 NOT NULL,
  `FIELD_TYPE` varchar(767) CHARACTER SET latin1 NOT NULL,
  `INTEGER_IDX` int(11) NOT NULL,
  PRIMARY KEY (`TYPE_NAME`,`FIELD_NAME`),
  KEY `TYPE_FIELDS_N49` (`TYPE_NAME`),
  CONSTRAINT `TYPE_FIELDS_FK1` FOREIGN KEY (`TYPE_NAME`) REFERENCES `TYPES` (`TYPES_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

-- Table `MASTER_KEYS` for classes [org.apache.hadoop.hive.metastore.model.MMasterKey]
CREATE TABLE IF NOT EXISTS `MASTER_KEYS`
(
  `KEY_ID` INTEGER NOT NULL AUTO_INCREMENT,
  `MASTER_KEY` VARCHAR(767) BINARY NULL,
  PRIMARY KEY (`KEY_ID`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

-- Table `DELEGATION_TOKENS` for classes [org.apache.hadoop.hive.metastore.model.MDelegationToken]
CREATE TABLE IF NOT EXISTS `DELEGATION_TOKENS`
(
  `TOKEN_IDENT` VARCHAR(767) BINARY NOT NULL,
  `TOKEN` VARCHAR(767) BINARY NULL,
  PRIMARY KEY (`TOKEN_IDENT`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

--
-- Table structure for VERSION
--
CREATE TABLE IF NOT EXISTS `VERSION` (
  `VER_ID` BIGINT NOT NULL,
  `SCHEMA_VERSION` VARCHAR(127) NOT NULL,
  `VERSION_COMMENT` VARCHAR(255),
  PRIMARY KEY (`VER_ID`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

--
-- Table structure for table FUNCS
--
CREATE TABLE IF NOT EXISTS `FUNCS` (
  `FUNC_ID` BIGINT(20) NOT NULL,
  `CLASS_NAME` VARCHAR(4000) CHARACTER SET latin1,
  `CREATE_TIME` INT(11) NOT NULL,
  `DB_ID` BIGINT(20),
  `FUNC_NAME` VARCHAR(128) CHARACTER SET latin1,
  `FUNC_TYPE` INT(11) NOT NULL,
  `OWNER_NAME` VARCHAR(128) CHARACTER SET latin1,
  `OWNER_TYPE` VARCHAR(10) CHARACTER SET latin1,
  PRIMARY KEY (`FUNC_ID`),
  UNIQUE KEY `UNIQUEFUNCTION` (`FUNC_NAME`, `DB_ID`),
  KEY `FUNCS_N49` (`DB_ID`),
  CONSTRAINT `FUNC_DB_FK` FOREIGN KEY (`DB_ID`) REFERENCES `DBS` (`DB_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

--
-- Table structure for table FUNC_RU
--
CREATE TABLE IF NOT EXISTS `FUNC_RU` (
  `FUNC_ID` BIGINT(20) NOT NULL,
  `RESOURCE_TYPE` INT(11) NOT NULL,
  `RESOURCE_URI` VARCHAR(4000) CHARACTER SET latin1,
  `INTEGER_IDX` INT(11) NOT NULL,
  PRIMARY KEY (`FUNC_ID`, `INTEGER_IDX`),
  CONSTRAINT `FUNC_RU_FUNCS_FK` FOREIGN KEY (`FUNC_ID`) REFERENCES `FUNCS` (`FUNC_ID`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

CREATE TABLE IF NOT EXISTS `NOTIFICATION_LOG`
(
  `NL_ID` BIGINT(20) NOT NULL,
  `EVENT_ID` BIGINT(20) NOT NULL,
  `EVENT_TIME` INT(11) NOT NULL,
  `EVENT_TYPE` varchar(32) NOT NULL,
  `DB_NAME` varchar(128),
  `TBL_NAME` varchar(256),
  `MESSAGE` longtext,
  `MESSAGE_FORMAT` varchar(16),
  PRIMARY KEY (`NL_ID`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

CREATE TABLE IF NOT EXISTS `NOTIFICATION_SEQUENCE`
(
  `NNI_ID` BIGINT(20) NOT NULL,
  `NEXT_EVENT_ID` BIGINT(20) NOT NULL,
  PRIMARY KEY (`NNI_ID`)
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

CREATE TABLE IF NOT EXISTS `KEY_CONSTRAINTS`
(
  `CHILD_CD_ID` BIGINT,
  `CHILD_INTEGER_IDX` INT(11),
  `CHILD_TBL_ID` BIGINT,
  `PARENT_CD_ID` BIGINT NOT NULL,
  `PARENT_INTEGER_IDX` INT(11) NOT NULL,
  `PARENT_TBL_ID` BIGINT NOT NULL,
  `POSITION` BIGINT NOT NULL,
  `CONSTRAINT_NAME` VARCHAR(400) NOT NULL,
  `CONSTRAINT_TYPE` SMALLINT(6)  NOT NULL,
  `UPDATE_RULE` SMALLINT(6),
  `DELETE_RULE` SMALLINT(6),
  `ENABLE_VALIDATE_RELY` SMALLINT(6) NOT NULL,
  PRIMARY KEY (`CONSTRAINT_NAME`, `POSITION`),
  CONSTRAINT `KEY_CONSTRAINTS_FK1` FOREIGN KEY (`CHILD_CD_ID`) REFERENCES `CDS` (`CD_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `KEY_CONSTRAINTS_FK3` FOREIGN KEY (`PARENT_CD_ID`) REFERENCES `CDS` (`CD_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `KEY_CONSTRAINTS_FK2` FOREIGN KEY (`CHILD_TBL_ID`) REFERENCES `TBLS` (`TBL_ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `KEY_CONSTRAINTS_FK4` FOREIGN KEY (`PARENT_TBL_ID`) REFERENCES `TBLS` (`TBL_ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=ndbcluster DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

CREATE INDEX `CONSTRAINTS_PARENT_TABLE_ID_INDEX` ON KEY_CONSTRAINTS (`PARENT_TBL_ID`) USING BTREE;

-- ----------------------------
-- Transaction and Lock Tables
-- ----------------------------
SOURCE hive-txn-schema-2.3.0.1.mysql.sql;

-- -----------------------------------------------------------------
-- Record schema version. Should be the last step in the init script
-- -----------------------------------------------------------------
INSERT INTO VERSION (VER_ID, SCHEMA_VERSION, VERSION_COMMENT) VALUES (1, '2.3.0.1', 'HopsHive release version 2.3.0.1');

/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-08-23  0:56:31
