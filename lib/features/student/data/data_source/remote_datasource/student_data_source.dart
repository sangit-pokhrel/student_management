import 'package:student_management/features/student/domain/entity/student_entity.dart';

abstract interface class IStudentDataSource {
  Future<List<StudentEntity>> getStudents();
  Future<void> createStudent (StudentEntity student);
  Future<void> deleteStudent(String id);
}