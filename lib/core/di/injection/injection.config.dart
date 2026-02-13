// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../features/ocr/presentation/cubit/ocr_cubit.dart' as _i494;
import '../../../router/app_router.dart' as _i810;
import '../../services/image_picker_service.dart' as _i928;
import '../../services/ocr_service.dart' as _i188;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i928.ImagePickerService>(() => _i928.ImagePickerService());
    gh.singleton<_i810.AppRouter>(() => _i810.AppRouter());
    gh.factory<_i188.OCRService>(
      () => _i188.OCRService(gh<_i928.ImagePickerService>()),
    );
    gh.factory<_i494.OcrCubit>(() => _i494.OcrCubit(gh<_i188.OCRService>()));
    return this;
  }
}
