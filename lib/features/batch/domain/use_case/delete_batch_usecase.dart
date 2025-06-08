import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:student_management/core/error/failure.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management/features/batch/domain/repository/batch_repository.dart';
import 'package:student_management/app/use_case/usecase.dart';
class DeleteBatchParams extends Equatable {
  final String batchName;

  const DeleteBatchParams({required this.batchName});

  //Empty constructor
  const DeleteBatchParams.empty() : batchName = '_empty.string';

  @override
  List<Object?> get props => [batchName];
}

class DeleteBatchUseCase implements UsecaseWithParams<void, DeleteBatchParams> {
  final IBatchRepository batchRepository;

  DeleteBatchUseCase({required this.batchRepository});

  @override
  Future<Either<Failure, void>> call(DeleteBatchParams params) async {
    return await batchRepository.createBatch(
      BatchEntity(batchName: params.batchName),
    );
  }
}