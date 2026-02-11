// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [DrawPage]
class DrawRoute extends PageRouteInfo<void> {
  const DrawRoute({List<PageRouteInfo>? children})
    : super(DrawRoute.name, initialChildren: children);

  static const String name = 'DrawRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DrawPage();
    },
  );
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [ProductDetailsPage]
class ProductDetailsRoute extends PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({Key? key, int? id, List<PageRouteInfo>? children})
    : super(
        ProductDetailsRoute.name,
        args: ProductDetailsRouteArgs(key: key, id: id),
        rawQueryParams: {'id': id},
        initialChildren: children,
      );

  static const String name = 'ProductDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<ProductDetailsRouteArgs>(
        orElse: () => ProductDetailsRouteArgs(id: queryParams.optInt('id')),
      );
      return ProductDetailsPage(key: args.key, id: args.id);
    },
  );
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({this.key, this.id});

  final Key? key;

  final int? id;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProductDetailsRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}
