import 'package:flutter/material.dart';
import 'package:ecommerce_application_with_flutter_firebase_bloc/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_application_with_flutter_firebase_bloc/models/catagory_model.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => HomeScreen(), settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Zero to Unicorn'),
      bottomNavigationBar: CostumNavBar(),
      body: Container(
        child: CarouselSlider(
          options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height),
          items: Category.catagories
              .map((category) => HeroCarouselCard.HeroCarouselCard(
                    category: category,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
