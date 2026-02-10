import 'package:flutter/material.dart';
import 'package:practise/core/di/injection/injection.dart';
import 'package:practise/router/app_router.dart';

class App extends StatelessWidget {
  App({super.key});

  final _router = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Deep Linking',
      routerConfig: _router.config(
        // deepLinkTransformer: (uri) {
        //   if (uri.path.startsWith('/products')) {
        //     return SynchronousFuture(uri);
        //   }
        //   return SynchronousFuture(uri);
        // },
        //
        // deepLinkBuilder: (deepLink) {
        //   if (deepLink.path.isEmpty || deepLink.path == '/') {
        //     return deepLink;
        //   }
        //
        //   // Logic: Only allow navigation if it starts with our expected paths
        //   if (deepLink.path.startsWith('/products')) {
        //     return deepLink;
        //   }
        //
        //   // Fallback to Home for unknown links
        //   return DeepLink.defaultPath;
        // },
        placeholder: (context) => const Scaffold(
          body: Center(child: CircularProgressIndicator.adaptive()),
        ),
      ),
    );
  }
}
