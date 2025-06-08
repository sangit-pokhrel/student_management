import 'package:student_management/core/network/hive_service.dart';
import 'package:student_management/features/student/data/data_source/remote_datasource/student_data_source.dart';
import 'package:student_management/features/student/data/model/student_hive.model.dart';
import 'package:student_management/features/student/domain/entity/student_entity.dart';

class StudentLocalDataSource implements IStudentDataSource {

  final HiveService _hiveService;

  StudentLocalDataSource(this._hiveService);
  @override
  Future<void> createStudent(StudentEntity student) async {

     try {
      // Convert BatchEntity to BatchHiveModel
      final studentHiveModel = StudentHivemodel.fromEntity(student);
      await _hiveService.addStudent(studentHiveModel);
    } catch(e){
      throw Exception(e);
    }
    
  }

  @override
  Future<void> deleteStudent(String id) async {

    try{
      await _hiveService.deleteStudent(id);

    }catch(e){
      throw Exception("Failed to delete: $e");
    }
   
  }

  @override
  Future<List<StudentEntity>> getStudents() async {

    try{
      final hiveStudents = await _hiveService.getAllStudents();
      return hiveStudents.map((student) => student.toEntity()).toList();

    }catch(e){
      throw Exception("Failed to retrieve students: $e");
    }
    
  }
}