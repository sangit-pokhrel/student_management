import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:student_management/core/error/failure.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';
import 'package:student_management/features/batch/domain/repository/batch_repository.dart';
import 'package:student_management/app/use_case/usecase.dart';


class GetAllBatchParams extends Equatable {
  final String batchName;

  const GetAllBatchParams({required this.batchName});

  //Empty constructor
  const GetAllBatchParams.empty() : batchName = '_empty.string';

  @override
  List<Object?> get props => [batchName];
}

abstract class GetAllBatchUseCase implements UsecaseWithParams<void, GetAllBatchParams> {
  final IBatchRepository batchRepository;

  GetAllBatchUseCase({required this.batchRepository});

  @override
  Future<Either<Failure, void>> call(GetAllBatchParams params) async {
    return await batchRepository.createBatch(
      BatchEntity(batchName: params.batchName),
    );
  }
}