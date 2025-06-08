
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_management/app/constant/hive/hive_table_constant.dart';
import 'package:student_management/features/student/domain/entity/student_entity.dart';
import 'package:uuid/uuid.dart';
part 'student_hive.model.g.dart';

@HiveType(typeId: HiveTableConstant.studentTableId)
class StudentHivemodel extends Equatable {
  @HiveField(0)
  final String studentId;
  @HiveField(1)
  final String studentName;

  StudentHivemodel({String? studentId, required this.studentName}) : studentId = studentId ?? Uuid().v4();

  const StudentHivemodel.initial()
      :studentName = "",
        studentId= "";

  factory StudentHivemodel.fromEntity(StudentEntity entity) {
    return StudentHivemodel(
      studentName: entity.studentName,
      studentId: entity.studentId,
    );
  }

  StudentEntity toEntity() {
    return StudentEntity(
      studentName: studentName,
      studentId: studentId,
    );
  }

  static List<StudentEntity> toEntityList(List<StudentHivemodel> entities) {
    return entities.map((x) => x.toEntity()).toList();
  }

  @override
  List<Object?> get props => [studentId, studentName];
}