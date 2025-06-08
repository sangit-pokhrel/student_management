

import 'package:equatable/equatable.dart';

sealed class BatchEvent extends Equatable{
  const BatchEvent();
  @override
  List<Object> get props => [];

}

final class LoadBatchEvent extends BatchEvent {}

final class AddBatchEvent extends BatchEvent {
  final String batchName;
  const AddBatchEvent(this.batchName);

  @override
  List<Object> get props => [batchName];






}

final class DeleteBatchEvent extends BatchEvent {
  final String batchId;
  const DeleteBatchEvent(this.batchId);

  @override
  List<Object> get props => [batchId];






}

