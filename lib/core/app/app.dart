import 'package:flutter/material.dart';
import 'package:practise/core/di/injection/injection.dart';
import 'package:practise/router/app_router.dart';

class App extends StatelessWidget {
  App({super.key});

  final _router = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router.config());
  }
}
