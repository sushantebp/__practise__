import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:practise/features/draw/presentation/pages/draw_page.dart';
import 'package:practise/features/ocr/presentation/pages/ocr_page.dart';

import '../features/home/presentation/pages/home_page.dart';
import '../features/products/presentation/pages/product_details_page.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: false),
    AutoRoute(page: ProductDetailsRoute.page),
    AutoRoute(page: DrawRoute.page, initial: false),
    AutoRoute(page: OcrRoute.page, initial: true),
  ];
}
