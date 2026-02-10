import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:practise/router/app_router.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppLinks get _appLinks => AppLinks();

  StreamSubscription<Uri>? _linkSub;

  @override
  void initState() {
    super.initState();
    _initDeepLinks();
  }

  @override
  void dispose() {
    _linkSub?.cancel();
    super.dispose();
  }

  void _initDeepLinks() async {
    final initialLink = await _appLinks.getInitialLink();
    if (initialLink != null) {
      _handleLink(initialLink);
    }
    _linkSub = _appLinks.uriLinkStream.listen((uri) => _handleLink(uri));
  }

  void _handleLink(Uri uri) {
    String? idString;

    if (uri.queryParameters.containsKey('id')) {
      idString = uri.queryParameters['id'];
    } else if (uri.pathSegments.contains('products')) {
      final index = uri.pathSegments.indexOf('products');
      // If there's a segment after 'products', that's our ID
      if (index != -1 && uri.pathSegments.length > index + 1) {
        idString = uri.pathSegments[index + 1];
      }
    }

    if (idString != null) {
      final id = int.tryParse(idString);
      if (id != null) {
        context.router.push(ProductDetailsRoute(id: id));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Deep Link Listener Active')),
    );
  }
}
