part of 'ocr_cubit.dart';

enum OCRStatus {
  initial,
  scanning,
  success(message: 'Scan completed'),
  failure(message: 'Scan failed');

  const OCRStatus({this.message});
  final String? message;

  bool get isScanning => this == OCRStatus.scanning;
  bool get isInitial => this == OCRStatus.initial;
  bool get isFailure => this == OCRStatus.failure;
  bool get isSuccess => this == OCRStatus.success;
}

@freezed
abstract class OcrState with _$OcrState {
  const OcrState._();

  const factory OcrState({@Default(OCRStatus.initial) OCRStatus status, String? result}) = _OcrState;

  bool get canRefresh => status != OCRStatus.scanning;
}
