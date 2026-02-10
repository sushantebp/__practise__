import 'package:flutter/material.dart';
import 'package:practise/core/app/app.dart';

import 'core/di/injection/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(App());
}
