import 'package:dartz/dartz.dart';
import 'package:student_management/core/error/failure.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management/features/batch/domain/repository/batch_repository.dart';

class BatchLocalRepository  implements IBatchRepository {
     final BatchLocalRepository _batchLocalDataSource;

  BatchLocalRepository({required BatchLocalRepository batchLocalDataSource}) : _batchLocalDataSource = batchLocalDataSource;
  @override
  Future<Either<Failure, void>> createBatch(BatchEntity batch) {
    try{
        _batchLocalDataSource.createBatch(batch);
        return Future.value(Right(null));
    }catch(e){
        return Future.value(Left(LocalDatabaseFailure(message: e . toString())));

    }
  }

  @override
  Future<Either<Failure, void>>deleteBatch(String id) {
    try{
        _batchLocalDataSource.deleteBatch(id);
        return Future.value(Right(null));
    }catch(e){
        return Future.value(Left(LocalDatabaseFailure(message: e . toString())));

    }
   
  }

  @override
  Future<Either<Failure, List<BatchEntity>>> getBatches() {
    // TODO: implement getBatches
    throw UnimplementedError();
  }
}
