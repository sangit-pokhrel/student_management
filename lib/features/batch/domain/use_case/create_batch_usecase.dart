

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:student_management/app/use_case/usecase.dart';
import 'package:student_management/core/error/failure.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management/features/batch/domain/repository/batch_repository.dart';

class CreateBatchParams extends Equatable {
  final String batchName;

  const CreateBatchParams({required this.batchName});

  //EMPTY CONSTRUCTOR
  const CreateBatchParams.empty() : batchName = '_empty.string';
  @override
  List<Object?> get props => [batchName];
}

class CreateBatchUseCase implements UsecaseWithParams<void, CreateBatchParams> {
 final IBatchRepository batchRepository;

  CreateBatchUseCase(this.batchRepository);

  @override
  Future<Either<Failure, void>> call(CreateBatchParams params) async {
    return await batchRepository.createBatch(
      BatchEntity(
        batchName : params.batchName,
      )
    );
  }
}