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
public class AddCheckConstraintRequest implements org.apache.thrift.TBase<AddCheckConstraintRequest, AddCheckConstraintRequest._Fields>, java.io.Serializable, Cloneable, Comparable<AddCheckConstraintRequest> {
  private static final org.apache.thrift.protocol.TStruct STRUCT_DESC = new org.apache.thrift.protocol.TStruct("AddCheckConstraintRequest");

  private static final org.apache.thrift.protocol.TField CHECK_CONSTRAINT_COLS_FIELD_DESC = new org.apache.thrift.protocol.TField("checkConstraintCols", org.apache.thrift.protocol.TType.LIST, (short)1);

  private static final Map<Class<? extends IScheme>, SchemeFactory> schemes = new HashMap<Class<? extends IScheme>, SchemeFactory>();
  static {
    schemes.put(StandardScheme.class, new AddCheckConstraintRequestStandardSchemeFactory());
    schemes.put(TupleScheme.class, new AddCheckConstraintRequestTupleSchemeFactory());
  }

  private List<SQLCheckConstraint> checkConstraintCols; // required

  /** The set of fields this struct contains, along with convenience methods for finding and manipulating them. */
  public enum _Fields implements org.apache.thrift.TFieldIdEnum {
    CHECK_CONSTRAINT_COLS((short)1, "checkConstraintCols");

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
        case 1: // CHECK_CONSTRAINT_COLS
          return CHECK_CONSTRAINT_COLS;
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
    tmpMap.put(_Fields.CHECK_CONSTRAINT_COLS, new org.apache.thrift.meta_data.FieldMetaData("checkConstraintCols", org.apache.thrift.TFieldRequirementType.REQUIRED, 
        new org.apache.thrift.meta_data.ListMetaData(org.apache.thrift.protocol.TType.LIST, 
            new org.apache.thrift.meta_data.StructMetaData(org.apache.thrift.protocol.TType.STRUCT, SQLCheckConstraint.class))));
    metaDataMap = Collections.unmodifiableMap(tmpMap);
    org.apache.thrift.meta_data.FieldMetaData.addStructMetaDataMap(AddCheckConstraintRequest.class, metaDataMap);
  }

  public AddCheckConstraintRequest() {
  }

  public AddCheckConstraintRequest(
    List<SQLCheckConstraint> checkConstraintCols)
  {
    this();
    this.checkConstraintCols = checkConstraintCols;
  }

  /**
   * Performs a deep copy on <i>other</i>.
   */
  public AddCheckConstraintRequest(AddCheckConstraintRequest other) {
    if (other.isSetCheckConstraintCols()) {
      List<SQLCheckConstraint> __this__checkConstraintCols = new ArrayList<SQLCheckConstraint>(other.checkConstraintCols.size());
      for (SQLCheckConstraint other_element : other.checkConstraintCols) {
        __this__checkConstraintCols.add(new SQLCheckConstraint(other_element));
      }
      this.checkConstraintCols = __this__checkConstraintCols;
    }
  }

  public AddCheckConstraintRequest deepCopy() {
    return new AddCheckConstraintRequest(this);
  }

  @Override
  public void clear() {
    this.checkConstraintCols = null;
  }

  public int getCheckConstraintColsSize() {
    return (this.checkConstraintCols == null) ? 0 : this.checkConstraintCols.size();
  }

  public java.util.Iterator<SQLCheckConstraint> getCheckConstraintColsIterator() {
    return (this.checkConstraintCols == null) ? null : this.checkConstraintCols.iterator();
  }

  public void addToCheckConstraintCols(SQLCheckConstraint elem) {
    if (this.checkConstraintCols == null) {
      this.checkConstraintCols = new ArrayList<SQLCheckConstraint>();
    }
    this.checkConstraintCols.add(elem);
  }

  public List<SQLCheckConstraint> getCheckConstraintCols() {
    return this.checkConstraintCols;
  }

  public void setCheckConstraintCols(List<SQLCheckConstraint> checkConstraintCols) {
    this.checkConstraintCols = checkConstraintCols;
  }

  public void unsetCheckConstraintCols() {
    this.checkConstraintCols = null;
  }

  /** Returns true if field checkConstraintCols is set (has been assigned a value) and false otherwise */
  public boolean isSetCheckConstraintCols() {
    return this.checkConstraintCols != null;
  }

  public void setCheckConstraintColsIsSet(boolean value) {
    if (!value) {
      this.checkConstraintCols = null;
    }
  }

  public void setFieldValue(_Fields field, Object value) {
    switch (field) {
    case CHECK_CONSTRAINT_COLS:
      if (value == null) {
        unsetCheckConstraintCols();
      } else {
        setCheckConstraintCols((List<SQLCheckConstraint>)value);
      }
      break;

    }
  }

  public Object getFieldValue(_Fields field) {
    switch (field) {
    case CHECK_CONSTRAINT_COLS:
      return getCheckConstraintCols();

    }
    throw new IllegalStateException();
  }

  /** Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise */
  public boolean isSet(_Fields field) {
    if (field == null) {
      throw new IllegalArgumentException();
    }

    switch (field) {
    case CHECK_CONSTRAINT_COLS:
      return isSetCheckConstraintCols();
    }
    throw new IllegalStateException();
  }

  @Override
  public boolean equals(Object that) {
    if (that == null)
      return false;
    if (that instanceof AddCheckConstraintRequest)
      return this.equals((AddCheckConstraintRequest)that);
    return false;
  }

  public boolean equals(AddCheckConstraintRequest that) {
    if (that == null)
      return false;

    boolean this_present_checkConstraintCols = true && this.isSetCheckConstraintCols();
    boolean that_present_checkConstraintCols = true && that.isSetCheckConstraintCols();
    if (this_present_checkConstraintCols || that_present_checkConstraintCols) {
      if (!(this_present_checkConstraintCols && that_present_checkConstraintCols))
        return false;
      if (!this.checkConstraintCols.equals(that.checkConstraintCols))
        return false;
    }

    return true;
  }

  @Override
  public int hashCode() {
    List<Object> list = new ArrayList<Object>();

    boolean present_checkConstraintCols = true && (isSetCheckConstraintCols());
    list.add(present_checkConstraintCols);
    if (present_checkConstraintCols)
      list.add(checkConstraintCols);

    return list.hashCode();
  }

  @Override
  public int compareTo(AddCheckConstraintRequest other) {
    if (!getClass().equals(other.getClass())) {
      return getClass().getName().compareTo(other.getClass().getName());
    }

    int lastComparison = 0;

    lastComparison = Boolean.valueOf(isSetCheckConstraintCols()).compareTo(other.isSetCheckConstraintCols());
    if (lastComparison != 0) {
      return lastComparison;
    }
    if (isSetCheckConstraintCols()) {
      lastComparison = org.apache.thrift.TBaseHelper.compareTo(this.checkConstraintCols, other.checkConstraintCols);
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
    StringBuilder sb = new StringBuilder("AddCheckConstraintRequest(");
    boolean first = true;

    sb.append("checkConstraintCols:");
    if (this.checkConstraintCols == null) {
      sb.append("null");
    } else {
      sb.append(this.checkConstraintCols);
    }
    first = false;
    sb.append(")");
    return sb.toString();
  }

  public void validate() throws org.apache.thrift.TException {
    // check for required fields
    if (!isSetCheckConstraintCols()) {
      throw new org.apache.thrift.protocol.TProtocolException("Required field 'checkConstraintCols' is unset! Struct:" + toString());
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

  private static class AddCheckConstraintRequestStandardSchemeFactory implements SchemeFactory {
    public AddCheckConstraintRequestStandardScheme getScheme() {
      return new AddCheckConstraintRequestStandardScheme();
    }
  }

  private static class AddCheckConstraintRequestStandardScheme extends StandardScheme<AddCheckConstraintRequest> {

    public void read(org.apache.thrift.protocol.TProtocol iprot, AddCheckConstraintRequest struct) throws org.apache.thrift.TException {
      org.apache.thrift.protocol.TField schemeField;
      iprot.readStructBegin();
      while (true)
      {
        schemeField = iprot.readFieldBegin();
        if (schemeField.type == org.apache.thrift.protocol.TType.STOP) { 
          break;
        }
        switch (schemeField.id) {
          case 1: // CHECK_CONSTRAINT_COLS
            if (schemeField.type == org.apache.thrift.protocol.TType.LIST) {
              {
                org.apache.thrift.protocol.TList _list400 = iprot.readListBegin();
                struct.checkConstraintCols = new ArrayList<SQLCheckConstraint>(_list400.size);
                SQLCheckConstraint _elem401;
                for (int _i402 = 0; _i402 < _list400.size; ++_i402)
                {
                  _elem401 = new SQLCheckConstraint();
                  _elem401.read(iprot);
                  struct.checkConstraintCols.add(_elem401);
                }
                iprot.readListEnd();
              }
              struct.setCheckConstraintColsIsSet(true);
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

    public void write(org.apache.thrift.protocol.TProtocol oprot, AddCheckConstraintRequest struct) throws org.apache.thrift.TException {
      struct.validate();

      oprot.writeStructBegin(STRUCT_DESC);
      if (struct.checkConstraintCols != null) {
        oprot.writeFieldBegin(CHECK_CONSTRAINT_COLS_FIELD_DESC);
        {
          oprot.writeListBegin(new org.apache.thrift.protocol.TList(org.apache.thrift.protocol.TType.STRUCT, struct.checkConstraintCols.size()));
          for (SQLCheckConstraint _iter403 : struct.checkConstraintCols)
          {
            _iter403.write(oprot);
          }
          oprot.writeListEnd();
        }
        oprot.writeFieldEnd();
      }
      oprot.writeFieldStop();
      oprot.writeStructEnd();
    }

  }

  private static class AddCheckConstraintRequestTupleSchemeFactory implements SchemeFactory {
    public AddCheckConstraintRequestTupleScheme getScheme() {
      return new AddCheckConstraintRequestTupleScheme();
    }
  }

  private static class AddCheckConstraintRequestTupleScheme extends TupleScheme<AddCheckConstraintRequest> {

    @Override
    public void write(org.apache.thrift.protocol.TProtocol prot, AddCheckConstraintRequest struct) throws org.apache.thrift.TException {
      TTupleProtocol oprot = (TTupleProtocol) prot;
      {
        oprot.writeI32(struct.checkConstraintCols.size());
        for (SQLCheckConstraint _iter404 : struct.checkConstraintCols)
        {
          _iter404.write(oprot);
        }
      }
    }

    @Override
    public void read(org.apache.thrift.protocol.TProtocol prot, AddCheckConstraintRequest struct) throws org.apache.thrift.TException {
      TTupleProtocol iprot = (TTupleProtocol) prot;
      {
        org.apache.thrift.protocol.TList _list405 = new org.apache.thrift.protocol.TList(org.apache.thrift.protocol.TType.STRUCT, iprot.readI32());
        struct.checkConstraintCols = new ArrayList<SQLCheckConstraint>(_list405.size);
        SQLCheckConstraint _elem406;
        for (int _i407 = 0; _i407 < _list405.size; ++_i407)
        {
          _elem406 = new SQLCheckConstraint();
          _elem406.read(iprot);
          struct.checkConstraintCols.add(_elem406);
        }
      }
      struct.setCheckConstraintColsIsSet(true);
    }
  }

}

