import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_management/features/batch/domain/use_case/create_batch_usecase.dart';
import 'package:student_management/features/batch/domain/use_case/delete_batch_usecase.dart';
import 'package:student_management/features/batch/domain/use_case/get_all_batch_usecase.dart';
import 'package:student_management/features/batch/presentation/view_model/batch_event.dart';
import 'package:student_management/features/batch/presentation/view_model/batch_state.dart';

class BatchBloc extends Bloc<BatchEvent, BatchState> {
  final CreateBatchUseCase _createBatchUseCase;
  final DeleteBatchUseCase _deleteBatchUseCase;
  final GetAllBatchUseCase _getAllBatchUseCase;

  BatchBloc({
    required CreateBatchUseCase createBatchUseCase,
    required GetAllBatchUseCase getAllBatchUseCase,
    required DeleteBatchUseCase deleteBatchUseCase

  }) : _createBatchUseCase = createBatchUseCase,
  _getAllBatchUseCase = getAllBatchUseCase,
  _deleteBatchUseCase = deleteBatchUseCase,
  super(BatchState.initial())
{
    on<LoadBatchEvent>(_onLoadBatches);
    on<AddBatchEvent>(_onCreateBatch);
    on<DeleteBatchEvent>(_onDeleteBatch);

    // Load batches when the ViewModel is initialized
    add(LoadBatchEvent());
}

 Future<void> _onLoadBatches(
    LoadBatchEvent event,
    Emitter<BatchState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    final result = await getA();
    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, error: failure.message));
      },
      (batches) {
        emit(state.copyWith(batches: batches, isLoading: false));
      },
    );
  }

  Future<void> _onCreateBatch(
    CreateBatchEvent event,
    Emitter<BatchState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1));
    final result = await createBatchUsecase(
      CreateBatchParams(batchName: event.batchName),
    );
    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, errorMessage: failure.message));
      },
      (_) {
        emit(state.copyWith(isLoading: false));
        add(LoadBatchEvent());
      },
    );
  }

  Future<void> _onDeleteBatch(
    DeleteBatchEvent event,
    Emitter<BatchState> emit,
  ) async {
    // Logic to delete a batch
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1));
    final result = await deleteBatchUsecase.call(
      DeleteBatchParams(batchId: event.batchId),
    );
    result.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, errorMessage: failure.message));
      },
      (_) {
        emit(state.copyWith(isLoading: false));
        add(LoadBatchEvent());
      },
    );
  }



  
}

