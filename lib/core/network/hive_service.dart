import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:student_management/app/constant/hive/hive_table_constant.dart';
import 'package:student_management/features/batch/data/model/batch_hive_model.dart';
import 'package:student_management/features/course/data/model/course_hive.model.dart';
import 'package:student_management/features/student/data/model/student_hive.model.dart';


class HiveService {
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path} student_management.db';

    Hive.init(path);

    Hive.registerAdapter(BatchHiveModelAdapter());
    Hive.registerAdapter(CourseHivemodelAdapter());
  }

  ///////////////////////////Batch Queries///////////////////////////////

  Future<void> addBatch(BatchHiveModel batch) async {
    var box = await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchBox);
    await box.put(batch.batchId, batch);
  }

  Future<List<BatchHiveModel>> getAllBatches() async {
    var box = await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchBox);
    var batches = box.values.toList();
    return batches;
  }

  Future<void> deleteBatch(String id) async {
    var box = await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchBox);
    await box.delete(id);
  }


  /////////////////////////////////Course Querie/////////////////
  
  Future<void> addCourse(CourseHivemodel course) async {
    var box = await Hive.openBox<CourseHivemodel>(HiveTableConstant.courseBox);
    await box.put(course.courseId, course);
  }

  Future<List<CourseHivemodel>> getAllCourses () async{
    var box= await Hive.openBox<CourseHivemodel>(HiveTableConstant.courseBox);
    var courses = box.values.toList();
    return courses;

  }

  Future<void> deleteCourse(String id) async{
    var box = await Hive.openBox<CourseHivemodel>(HiveTableConstant.courseBox);
    await box.delete(id);
  }

  ///////////////////////////////////////// Student Queries////////////////
   
  Future<void> addStudent(StudentHivemodel student) async{
    var box = await Hive.openBox<StudentHivemodel>(HiveTableConstant.studentBox);
    await box.put(student.studentId, student);
  }

  Future<List<StudentHivemodel>> getAllStudents () async{
    var box = await Hive.openBox<StudentHivemodel>(HiveTableConstant.studentBox);
    var students = box.values.toList();
    return students;
  }

  Future<void> deleteStudent(String id) async{
    var box= await Hive.openBox<StudentHivemodel>(HiveTableConstant.studentBox);
    await box.delete(id);
  }
   
}