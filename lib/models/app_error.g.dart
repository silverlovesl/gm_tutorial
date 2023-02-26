// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppError _$$_AppErrorFromJson(Map<String, dynamic> json) => _$_AppError(
      statusCode: json['statusCode'] as int?,
      errorCode: json['errorCode'] as int?,
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$$_AppErrorToJson(_$_AppError instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'errorCode': instance.errorCode,
      'reason': instance.reason,
    };
