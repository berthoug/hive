/**
 * Autogenerated by Thrift Compiler (0.9.3)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
package org.apache.hadoop.hive.metastore.api;

import org.apache.thrift.scheme.IScheme;
import org.apache.thrift.scheme.SchemeFactory;
import org.apache.thrift.scheme.StandardScheme;

import org.apache.thrift.scheme.TupleScheme;
import org.apache.thrift.protocol.TTupleProtocol;
import org.apache.thrift.protocol.TProtocolException;
import org.apache.thrift.EncodingUtils;
import org.apache.thrift.TException;
import org.apache.thrift.async.AsyncMethodCallback;
import org.apache.thrift.server.AbstractNonblockingServer.*;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.EnumMap;
import java.util.Set;
import java.util.HashSet;
import java.util.EnumSet;
import java.util.Collections;
import java.util.BitSet;
import java.nio.ByteBuffer;
import java.util.Arrays;
import javax.annotation.Generated;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SuppressWarnings({"cast", "rawtypes", "serial", "unchecked"})
@Generated(value = "Autogenerated by Thrift Compiler (0.9.3)")
public class ForeignKeysResponse implements org.apache.thrift.TBase<ForeignKeysResponse, ForeignKeysResponse._Fields>, java.io.Serializable, Cloneable, Comparable<ForeignKeysResponse> {
  private static final org.apache.thrift.protocol.TStruct STRUCT_DESC = new org.apache.thrift.protocol.TStruct("ForeignKeysResponse");

  private static final org.apache.thrift.protocol.TField FOREIGN_KEYS_FIELD_DESC = new org.apache.thrift.protocol.TField("foreignKeys", org.apache.thrift.protocol.TType.LIST, (short)1);

  private static final Map<Class<? extends IScheme>, SchemeFactory> schemes = new HashMap<Class<? extends IScheme>, SchemeFactory>();
  static {
    schemes.put(StandardScheme.class, new ForeignKeysResponseStandardSchemeFactory());
    schemes.put(TupleScheme.class, new ForeignKeysResponseTupleSchemeFactory());
  }

  private List<SQLForeignKey> foreignKeys; // required

  /** The set of fields this struct contains, along with convenience methods for finding and manipulating them. */
  public enum _Fields implements org.apache.thrift.TFieldIdEnum {
    FOREIGN_KEYS((short)1, "foreignKeys");

    private static final Map<String, _Fields> byName = new HashMap<String, _Fields>();

    static {
      for (_Fields field : EnumSet.allOf(_Fields.class)) {
        byName.put(field.getFieldName(), field);
      }
    }

    /**
     * Find the _Fields constant that matches fieldId, or null if its not found.
     */
    public static _Fields findByThriftId(int fieldId) {
      switch(fieldId) {
        case 1: // FOREIGN_KEYS
          return FOREIGN_KEYS;
        default:
          return null;
      }
    }

    /**
     * Find the _Fields constant that matches fieldId, throwing an exception
     * if it is not found.
     */
    public static _Fields findByThriftIdOrThrow(int fieldId) {
      _Fields fields = findByThriftId(fieldId);
      if (fields == null) throw new IllegalArgumentException("Field " + fieldId + " doesn't exist!");
      return fields;
    }

    /**
     * Find the _Fields constant that matches name, or null if its not found.
     */
    public static _Fields findByName(String name) {
      return byName.get(name);
    }

    private final short _thriftId;
    private final String _fieldName;

    _Fields(short thriftId, String fieldName) {
      _thriftId = thriftId;
      _fieldName = fieldName;
    }

    public short getThriftFieldId() {
      return _thriftId;
    }

    public String getFieldName() {
      return _fieldName;
    }
  }

  // isset id assignments
  public static final Map<_Fields, org.apache.thrift.meta_data.FieldMetaData> metaDataMap;
  static {
    Map<_Fields, org.apache.thrift.meta_data.FieldMetaData> tmpMap = new EnumMap<_Fields, org.apache.thrift.meta_data.FieldMetaData>(_Fields.class);
    tmpMap.put(_Fields.FOREIGN_KEYS, new org.apache.thrift.meta_data.FieldMetaData("foreignKeys", org.apache.thrift.TFieldRequirementType.REQUIRED, 
        new org.apache.thrift.meta_data.ListMetaData(org.apache.thrift.protocol.TType.LIST, 
            new org.apache.thrift.meta_data.StructMetaData(org.apache.thrift.protocol.TType.STRUCT, SQLForeignKey.class))));
    metaDataMap = Collections.unmodifiableMap(tmpMap);
    org.apache.thrift.meta_data.FieldMetaData.addStructMetaDataMap(ForeignKeysResponse.class, metaDataMap);
  }

  public ForeignKeysResponse() {
  }

  public ForeignKeysResponse(
    List<SQLForeignKey> foreignKeys)
  {
    this();
    this.foreignKeys = foreignKeys;
  }

  /**
   * Performs a deep copy on <i>other</i>.
   */
  public ForeignKeysResponse(ForeignKeysResponse other) {
    if (other.isSetForeignKeys()) {
      List<SQLForeignKey> __this__foreignKeys = new ArrayList<SQLForeignKey>(other.foreignKeys.size());
      for (SQLForeignKey other_element : other.foreignKeys) {
        __this__foreignKeys.add(new SQLForeignKey(other_element));
      }
      this.foreignKeys = __this__foreignKeys;
    }
  }

  public ForeignKeysResponse deepCopy() {
    return new ForeignKeysResponse(this);
  }

  @Override
  public void clear() {
    this.foreignKeys = null;
  }

  public int getForeignKeysSize() {
    return (this.foreignKeys == null) ? 0 : this.foreignKeys.size();
  }

  public java.util.Iterator<SQLForeignKey> getForeignKeysIterator() {
    return (this.foreignKeys == null) ? null : this.foreignKeys.iterator();
  }

  public void addToForeignKeys(SQLForeignKey elem) {
    if (this.foreignKeys == null) {
      this.foreignKeys = new ArrayList<SQLForeignKey>();
    }
    this.foreignKeys.add(elem);
  }

  public List<SQLForeignKey> getForeignKeys() {
    return this.foreignKeys;
  }

  public void setForeignKeys(List<SQLForeignKey> foreignKeys) {
    this.foreignKeys = foreignKeys;
  }

  public void unsetForeignKeys() {
    this.foreignKeys = null;
  }

  /** Returns true if field foreignKeys is set (has been assigned a value) and false otherwise */
  public boolean isSetForeignKeys() {
    return this.foreignKeys != null;
  }

  public void setForeignKeysIsSet(boolean value) {
    if (!value) {
      this.foreignKeys = null;
    }
  }

  public void setFieldValue(_Fields field, Object value) {
    switch (field) {
    case FOREIGN_KEYS:
      if (value == null) {
        unsetForeignKeys();
      } else {
        setForeignKeys((List<SQLForeignKey>)value);
      }
      break;

    }
  }

  public Object getFieldValue(_Fields field) {
    switch (field) {
    case FOREIGN_KEYS:
      return getForeignKeys();

    }
    throw new IllegalStateException();
  }

  /** Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise */
  public boolean isSet(_Fields field) {
    if (field == null) {
      throw new IllegalArgumentException();
    }

    switch (field) {
    case FOREIGN_KEYS:
      return isSetForeignKeys();
    }
    throw new IllegalStateException();
  }

  @Override
  public boolean equals(Object that) {
    if (that == null)
      return false;
    if (that instanceof ForeignKeysResponse)
      return this.equals((ForeignKeysResponse)that);
    return false;
  }

  public boolean equals(ForeignKeysResponse that) {
    if (that == null)
      return false;

    boolean this_present_foreignKeys = true && this.isSetForeignKeys();
    boolean that_present_foreignKeys = true && that.isSetForeignKeys();
    if (this_present_foreignKeys || that_present_foreignKeys) {
      if (!(this_present_foreignKeys && that_present_foreignKeys))
        return false;
      if (!this.foreignKeys.equals(that.foreignKeys))
        return false;
    }

    return true;
  }

  @Override
  public int hashCode() {
    List<Object> list = new ArrayList<Object>();

    boolean present_foreignKeys = true && (isSetForeignKeys());
    list.add(present_foreignKeys);
    if (present_foreignKeys)
      list.add(foreignKeys);

    return list.hashCode();
  }

  @Override
  public int compareTo(ForeignKeysResponse other) {
    if (!getClass().equals(other.getClass())) {
      return getClass().getName().compareTo(other.getClass().getName());
    }

    int lastComparison = 0;

    lastComparison = Boolean.valueOf(isSetForeignKeys()).compareTo(other.isSetForeignKeys());
    if (lastComparison != 0) {
      return lastComparison;
    }
    if (isSetForeignKeys()) {
      lastComparison = org.apache.thrift.TBaseHelper.compareTo(this.foreignKeys, other.foreignKeys);
      if (lastComparison != 0) {
        return lastComparison;
      }
    }
    return 0;
  }

  public _Fields fieldForId(int fieldId) {
    return _Fields.findByThriftId(fieldId);
  }

  public void read(org.apache.thrift.protocol.TProtocol iprot) throws org.apache.thrift.TException {
    schemes.get(iprot.getScheme()).getScheme().read(iprot, this);
  }

  public void write(org.apache.thrift.protocol.TProtocol oprot) throws org.apache.thrift.TException {
    schemes.get(oprot.getScheme()).getScheme().write(oprot, this);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder("ForeignKeysResponse(");
    boolean first = true;

    sb.append("foreignKeys:");
    if (this.foreignKeys == null) {
      sb.append("null");
    } else {
      sb.append(this.foreignKeys);
    }
    first = false;
    sb.append(")");
    return sb.toString();
  }

  public void validate() throws org.apache.thrift.TException {
    // check for required fields
    if (!isSetForeignKeys()) {
      throw new org.apache.thrift.protocol.TProtocolException("Required field 'foreignKeys' is unset! Struct:" + toString());
    }

    // check for sub-struct validity
  }

  private void writeObject(java.io.ObjectOutputStream out) throws java.io.IOException {
    try {
      write(new org.apache.thrift.protocol.TCompactProtocol(new org.apache.thrift.transport.TIOStreamTransport(out)));
    } catch (org.apache.thrift.TException te) {
      throw new java.io.IOException(te);
    }
  }

  private void readObject(java.io.ObjectInputStream in) throws java.io.IOException, ClassNotFoundException {
    try {
      read(new org.apache.thrift.protocol.TCompactProtocol(new org.apache.thrift.transport.TIOStreamTransport(in)));
    } catch (org.apache.thrift.TException te) {
      throw new java.io.IOException(te);
    }
  }

  private static class ForeignKeysResponseStandardSchemeFactory implements SchemeFactory {
    public ForeignKeysResponseStandardScheme getScheme() {
      return new ForeignKeysResponseStandardScheme();
    }
  }

  private static class ForeignKeysResponseStandardScheme extends StandardScheme<ForeignKeysResponse> {

    public void read(org.apache.thrift.protocol.TProtocol iprot, ForeignKeysResponse struct) throws org.apache.thrift.TException {
      org.apache.thrift.protocol.TField schemeField;
      iprot.readStructBegin();
      while (true)
      {
        schemeField = iprot.readFieldBegin();
        if (schemeField.type == org.apache.thrift.protocol.TType.STOP) { 
          break;
        }
        switch (schemeField.id) {
          case 1: // FOREIGN_KEYS
            if (schemeField.type == org.apache.thrift.protocol.TType.LIST) {
              {
                org.apache.thrift.protocol.TList _list328 = iprot.readListBegin();
                struct.foreignKeys = new ArrayList<SQLForeignKey>(_list328.size);
                SQLForeignKey _elem329;
                for (int _i330 = 0; _i330 < _list328.size; ++_i330)
                {
                  _elem329 = new SQLForeignKey();
                  _elem329.read(iprot);
                  struct.foreignKeys.add(_elem329);
                }
                iprot.readListEnd();
              }
              struct.setForeignKeysIsSet(true);
            } else { 
              org.apache.thrift.protocol.TProtocolUtil.skip(iprot, schemeField.type);
            }
            break;
          default:
            org.apache.thrift.protocol.TProtocolUtil.skip(iprot, schemeField.type);
        }
        iprot.readFieldEnd();
      }
      iprot.readStructEnd();
      struct.validate();
    }

    public void write(org.apache.thrift.protocol.TProtocol oprot, ForeignKeysResponse struct) throws org.apache.thrift.TException {
      struct.validate();

      oprot.writeStructBegin(STRUCT_DESC);
      if (struct.foreignKeys != null) {
        oprot.writeFieldBegin(FOREIGN_KEYS_FIELD_DESC);
        {
          oprot.writeListBegin(new org.apache.thrift.protocol.TList(org.apache.thrift.protocol.TType.STRUCT, struct.foreignKeys.size()));
          for (SQLForeignKey _iter331 : struct.foreignKeys)
          {
            _iter331.write(oprot);
          }
          oprot.writeListEnd();
        }
        oprot.writeFieldEnd();
      }
      oprot.writeFieldStop();
      oprot.writeStructEnd();
    }

  }

  private static class ForeignKeysResponseTupleSchemeFactory implements SchemeFactory {
    public ForeignKeysResponseTupleScheme getScheme() {
      return new ForeignKeysResponseTupleScheme();
    }
  }

  private static class ForeignKeysResponseTupleScheme extends TupleScheme<ForeignKeysResponse> {

    @Override
    public void write(org.apache.thrift.protocol.TProtocol prot, ForeignKeysResponse struct) throws org.apache.thrift.TException {
      TTupleProtocol oprot = (TTupleProtocol) prot;
      {
        oprot.writeI32(struct.foreignKeys.size());
        for (SQLForeignKey _iter332 : struct.foreignKeys)
        {
          _iter332.write(oprot);
        }
      }
    }

    @Override
    public void read(org.apache.thrift.protocol.TProtocol prot, ForeignKeysResponse struct) throws org.apache.thrift.TException {
      TTupleProtocol iprot = (TTupleProtocol) prot;
      {
        org.apache.thrift.protocol.TList _list333 = new org.apache.thrift.protocol.TList(org.apache.thrift.protocol.TType.STRUCT, iprot.readI32());
        struct.foreignKeys = new ArrayList<SQLForeignKey>(_list333.size);
        SQLForeignKey _elem334;
        for (int _i335 = 0; _i335 < _list333.size; ++_i335)
        {
          _elem334 = new SQLForeignKey();
          _elem334.read(iprot);
          struct.foreignKeys.add(_elem334);
        }
      }
      struct.setForeignKeysIsSet(true);
    }
  }

}

