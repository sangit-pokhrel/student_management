// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_hive.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentHivemodelAdapter extends TypeAdapter<StudentHivemodel> {
  @override
  final int typeId = 0;

  @override
  StudentHivemodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentHivemodel(
      studentId: fields[0] as String?,
      studentName: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StudentHivemodel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.studentId)
      ..writeByte(1)
      ..write(obj.studentName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentHivemodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
