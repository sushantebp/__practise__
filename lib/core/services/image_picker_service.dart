import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practise/core/exception/app_exception.dart';

@injectable
class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pickImage({ImageSource source = ImageSource.gallery}) async {
    try {
      final file = await _picker.pickImage(source: source);
      return file;
    } on PlatformException catch (e) {
      throw ImagePickerException(message: e.message ?? 'Failed to pick image', code: e.code);
    } catch (e, stack) {
      throw ImagePickerException(message: 'Failed to pick image', code: 'unknown', stackTrace: stack);
    }
  }
}
