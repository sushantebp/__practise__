import 'package:injectable/injectable.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practise/core/exception/app_exception.dart';
import 'image_picker_service.dart';

@injectable
class OCRService {
  final ImagePickerService _imagePickerService;
  final _textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

  OCRService(this._imagePickerService);

  Future<String> processImage({ImageSource source = ImageSource.gallery}) async {
    try {
      // 1. Pick the image
      final XFile? file = await _imagePickerService.pickImage(source: source);

      // 2. Handle 'No image selected'
      if (file == null) {
        throw const NoImageSelectedException(code: 'user_cancelled');
      }

      // 3. Prepare InputImage
      final inputImage = InputImage.fromFilePath(file.path);

      // 4. Process Text
      final RecognizedText recognizedText = await _textRecognizer.processImage(inputImage);

      if (recognizedText.text.trim().isEmpty) {
        return "No text found in the image.";
      }

      return recognizedText.text;
    } on NoImageSelectedException {
      // Re-throw the specific exception for the UI to handle
      rethrow;
    } on ImagePickerException {
      // If the picker service threw an error, we let it propagate
      rethrow;
    } catch (e, stack) {
      throw OCRException(
        message: 'Failed to recognize text: ${e.toString()}',
        code: 'ocr_processing_error',
        stackTrace: stack,
      );
    }
  }

  void dispose() {
    _textRecognizer.close();
  }
}
