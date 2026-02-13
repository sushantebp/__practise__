class AppException implements Exception {
  final String message;
  final String? code;
  final StackTrace? stackTrace;

  const AppException(this.message, {this.code, this.stackTrace});

  @override
  String toString() {
    return 'AppException(code: $code, message: $message)';
  }
}

class UnknownException extends AppException {
  const UnknownException(super.message, {super.code, super.stackTrace});
}

class NetworkException extends AppException {
  const NetworkException(super.message, {super.code, super.stackTrace});
}

class PermissionDeniedException extends AppException {
  const PermissionDeniedException(super.message, {super.code, super.stackTrace});
}

class ValidationException extends AppException {
  const ValidationException(super.message, {super.code, super.stackTrace});
}

class ImagePickerException extends AppException {
  const ImagePickerException({required String message, String? code, StackTrace? stackTrace})
    : super(message, code: code, stackTrace: stackTrace);
}

class NoImageSelectedException extends AppException {
  const NoImageSelectedException({String message = 'No image was selected', String? code}) : super(message, code: code);
}

class OCRException extends AppException {
  const OCRException({required String message, String? code, StackTrace? stackTrace})
    : super(message, code: code, stackTrace: stackTrace);
}
