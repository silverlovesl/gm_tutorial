import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_error.freezed.dart';
part 'app_error.g.dart';

@freezed
class AppError with _$AppError {
  const factory AppError({int? statusCode, int? errorCode, String? reason}) = _AppError;

  factory AppError.fromJson(Map<String, dynamic> json) => _$AppErrorFromJson(json);
}
