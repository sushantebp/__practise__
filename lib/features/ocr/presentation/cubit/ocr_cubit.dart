import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:practise/core/services/ocr_service.dart';

part 'ocr_state.dart';
part 'ocr_cubit.freezed.dart';

@injectable
class OcrCubit extends Cubit<OcrState> {
  final OCRService _ocrService;
  OcrCubit(this._ocrService) : super(const OcrState());

  Future<void> performScan({required ImageSource source}) async {
    emit(state.copyWith(status: OCRStatus.scanning, result: null));

    try {
      final text = await _ocrService.processImage(source: source);
      emit(state.copyWith(status: OCRStatus.success, result: text));
    } catch (e) {
      emit(state.copyWith(status: OCRStatus.failure, result: null));
    }
  }

  void reset() => emit(const OcrState(status: OCRStatus.initial, result: null));
}
