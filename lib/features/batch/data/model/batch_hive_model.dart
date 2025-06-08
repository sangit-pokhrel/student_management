import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:student_management/app/constant/hive/hive_table_constant.dart';
import 'package:student_management/features/batch/domain/entity/batch_entity.dart';
import 'package:uuid/uuid.dart';

part 'batch_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.batchTableId)
class BatchHiveModel extends Equatable {
  @HiveField(0)
  final String batchId;
  @HiveField(1)
  final String batchName;

  BatchHiveModel({String? batchId, required this.batchName}) : batchId = batchId ?? Uuid().v4();

  const BatchHiveModel.initial()
      : batchId = "",
        batchName = "";

  factory BatchHiveModel.fromEntity(BatchEntity entity) {
    return BatchHiveModel(
      batchName: entity.batchName,
      batchId: entity.batchId,
    );
  }

  BatchEntity toEntity() {
    return BatchEntity(
      batchName: batchName,
      batchId: batchId,
    );
  }

  static List<BatchEntity> toEntityList(List<BatchHiveModel> entities) {
    return entities.map((x) => x.toEntity()).toList();
  }

  @override
  List<Object?> get props => [batchId, batchName];
}