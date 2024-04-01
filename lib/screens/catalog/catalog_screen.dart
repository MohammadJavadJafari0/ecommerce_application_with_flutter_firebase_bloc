import 'package:flutter/material.dart';
import 'package:ecommerce_application_with_flutter_firebase_bloc/widgets/widgets.dart'
;
class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => CatalogScreen(), settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Catalog'),
      bottomNavigationBar: CostumNavBar(),
    );
  }
}
