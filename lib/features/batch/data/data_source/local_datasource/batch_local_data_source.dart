import 'package:student_management/core/network/hive_service.dart';
import 'package:student_management/features/batch/data/data_source/batch_data_source.dart';
import 'package:student_management/features/batch/data/model/batch_hive_model.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';

class BatchLocalDataSource  implements IBatchDataSource{
  final HiveService _hiveService;

  BatchLocalDataSource(this._hiveService);
  @override
  Future<void> createBatch(BatchEntity batch) async {

    try {
      // Convert BatchEntity to BatchHiveModel
      final batchHiveModel = BatchHiveModel.fromEntity(batch);
      await _hiveService.addBatch(batchHiveModel);
    } catch(e){
      throw Exception(e);
    }
  }

  @override
   Future<void> deleteBatch(String id) async {

    try {
      // Convert BatchEntity to BatchHiveModel
      await _hiveService.deleteBatch(id);
    } catch(e){
      throw Exception("Failed to delete branch: $e");
    }
  }

  @override
  Future<List<BatchEntity>> getBatches() async {
   try{
    final hiveBatches = await _hiveService.getAllBatches();
    return hiveBatches.map((batch) => batch.toEntity()).toList();
   }catch(e){
    throw Exception("Failed to retrieve batches: $e");
   }
  }
}