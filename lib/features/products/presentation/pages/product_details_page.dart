import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProductDetailsPage extends StatelessWidget {
  final int? id;
  const ProductDetailsPage({super.key, @QueryParam('id') this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product $id')),
      body: Center(child: Text('Showing details for product: $id')),
    );
  }
}
