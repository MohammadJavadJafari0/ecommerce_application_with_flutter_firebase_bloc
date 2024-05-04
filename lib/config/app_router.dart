import 'package:ecommerce_application_with_flutter_firebase_bloc/models/catagory_model.dart';
import 'package:ecommerce_application_with_flutter_firebase_bloc/models/models.dart';
import 'package:ecommerce_application_with_flutter_firebase_bloc/screens/product/product_screen.dart';
import 'package:ecommerce_application_with_flutter_firebase_bloc/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings setting) {
    print("This is route: ${setting.name}");

    switch (setting.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: setting.arguments as Product);
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: setting.arguments as Category);

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: const Text('Error')),
            ),
        settings: const RouteSettings(name: '/error'));
  }
}
