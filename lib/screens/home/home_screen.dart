import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_application_with_flutter_firebase_bloc/config/theme.dart';
import 'package:ecommerce_application_with_flutter_firebase_bloc/widgets/widgets.dart';

import '../../models/models.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => HomeScreen(), settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: customTheme(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'MJ',
        ),
        bottomNavigationBar: CostumNavBar(),
        body: ListView(
          children: [
            Column(
              children: [
                Container(
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
                SectionTitle(title: 'RECOMMENDED'),
                // Filter products by 'isRecommended' and convert the result to a list
                ProductCarousel(
                    products: Product.products
                        .where((product) => product.isRecommended)
                        .toList()),

                SectionTitle(title: 'MOST POPULAR'),
                ProductCarousel(
                    products: Product.products
                        .where((product) => product.isPopular)
                        .toList()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
