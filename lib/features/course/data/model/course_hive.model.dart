import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_management/app/constant/hive/hive_table_constant.dart';
import 'package:student_management/features/course/domain/entity/course_entity.dart';
import 'package:uuid/uuid.dart';

part 'course_hive.model.g.dart';

@HiveType(typeId: HiveTableConstant.courseTableId)
class CourseHivemodel extends Equatable {
  @HiveField(0)
  final String courseId;
  @HiveField(1)
  final String courseName;

  CourseHivemodel({String? courseId, required this.courseName}) : courseId = courseId ?? Uuid().v4();

  const CourseHivemodel.initial()
      : courseName = "",
        courseId= "";

  factory CourseHivemodel.fromEntity(CourseEntity entity) {
    return CourseHivemodel(
      courseName: entity.courseName,
      courseId: entity.courseId,
    );
  }

  CourseEntity toEntity() {
    return CourseEntity(
      courseName: courseName,
      courseId: courseId,
    );
  }

  static List<CourseEntity> toEntityList(List<CourseHivemodel> entities) {
    return entities.map((x) => x.toEntity()).toList();
  }

  @override
  List<Object?> get props => [courseId, courseName];
}