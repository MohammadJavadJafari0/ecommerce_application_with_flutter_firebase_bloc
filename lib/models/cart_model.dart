import 'package:ecommerce_application_with_flutter_firebase_bloc/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  Cart();

  static List<Product> products = [
    Product(
        name: 'Maxi Dress',
        catagory: 'Women',
        imageUrl:
            'https://m.media-amazon.com/images/I/71F0A0G65xL._AC_SY500_.jpg',
        price: 45.99,
        isPopular: true,
        isRecommended: true),
    Product(
        name: 'Mona pants',
        catagory: 'Women',
        imageUrl:
            'https://m.media-amazon.com/images/I/31tBp3eCyAL._SR240,220_.jpg',
        price: 50,
        isPopular: false,
        isRecommended: true),
    Product(
        name: 'Travel Backpack',
        catagory: 'Luggage & Travel',
        imageUrl:
            'https://m.media-amazon.com/images/I/71twnynE71L._AC_UL320_.jpg',
        price: 29.99,
        isPopular: true,
        isRecommended: false),
    Product(
        name: 'Lightweight ABS',
        catagory: 'Luggage & Travel',
        imageUrl:
            'https://m.media-amazon.com/images/I/81IWqnzKiiL._AC_UL320_.jpg',
        price: 44.99,
        isPopular: true,
        isRecommended: false),
    Product(
        name: 'Cotton hoodie',
        catagory: 'Men',
        imageUrl:
            'https://m.media-amazon.com/images/I/71trlmd1g6L._AC_UL320_.jpg',
        price: 86.99,
        isPopular: true,
        isRecommended: false),
    Product(
        name: 'cotton Shirts',
        catagory: 'Men',
        imageUrl:
            'https://m.media-amazon.com/images/I/61NAbTElNEL._AC_UL320_.jpg',
        price: 20.99,
        isPopular: true,
        isRecommended: true),
    Product(
        name: 'Boy jacket',
        catagory: 'Kids & Baby',
        imageUrl:
            'https://m.media-amazon.com/images/I/71DIFMUCTAL._AC_UL320_.jpg',
        price: 31.99,
        isPopular: true,
        isRecommended: true),
    Product(
        name: 'Girls Skirt',
        catagory: 'Kids & Baby',
        imageUrl:
            'https://m.media-amazon.com/images/I/81WVBb1njTL._AC_UL320_.jpg',
        price: 12.99,
        isPopular: true,
        isRecommended: true),
    Product(
        name: 'Printed Raincoat',
        catagory: 'Kids & Baby',
        imageUrl:
            'https://m.media-amazon.com/images/I/81T5z9xdQaL._AC_UL320_.jpg',
        price: 26.64,
        isPopular: false,
        isRecommended: true),
  ];
  @override
  List<Object?> get props => [];
}
