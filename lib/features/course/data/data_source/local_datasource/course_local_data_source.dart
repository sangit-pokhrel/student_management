import 'package:student_management/core/network/hive_service.dart';
import 'package:student_management/features/course/data/data_source/remote_datasource/course_data_source.dart';
import 'package:student_management/features/course/data/model/course_hive.model.dart';
import 'package:student_management/features/course/domain/entity/course_entity.dart';

class CourseLocalDataSource implements ICourseDataSource{

  final HiveService _hiveService;

  CourseLocalDataSource(this. _hiveService);
  @override
  Future<void> createCourse(CourseEntity course) async {

    try{

      final courseHiveModel = CourseHivemodel.fromEntity(course);
      await _hiveService.addCourse(courseHiveModel);
    }catch(e){
      throw Exception(e);
    }
    
   
  }

  @override
   Future<void> deleteCourse(String id) async {

    try {
      // Convert BatchEntity to BatchHiveModel
      await _hiveService.deleteCourse(id);
    } catch(e){
      throw Exception("Failed to delete branch: $e");
    }
  }

  @override
  Future<List<CourseEntity>> getCourses() async {
    try{
      final hiveCourses = await _hiveService.getAllCourses();
      return hiveCourses.map((course) => course.toEntity()).toList();
    }catch(e){
      throw Exception("Failed to retreive : $e");
    }
  }
}