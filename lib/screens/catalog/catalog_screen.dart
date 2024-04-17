import 'package:flutter/material.dart';
import 'package:ecommerce_application_with_flutter_firebase_bloc/widgets/widgets.dart';
import '../../models/models.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  static Route route({required Category category}) {
    return MaterialPageRoute(
        builder: (_) => CatalogScreen(category: category),
        settings: RouteSettings(name: routeName));
  }

  final Category category;
  const CatalogScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products;
    List<Product> filteredProducts = [];

    // Filter products based on category name
    if (categoryProducts.isNotEmpty) {
      filteredProducts = categoryProducts
          .where((product) => product.catagory == category.name)
          .toList();
    }

    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: CostumNavBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.15,
        ),
        itemCount: filteredProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: ProductCard(
              product: filteredProducts[index],
              widthFactor: 2.2,
            ),
          );
        },
      ),
    );
  }
}
