import 'package:equatable/equatable.dart';
import 'category.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  Map productQuantity(products) {
    var quantity = Map();

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });

    return quantity;         
  }

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  String get subtotalString => subtotal.toStringAsFixed(2);

  double deliveryFree(subtotal) {
    if (subtotal >= 100.0) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  String get deliveryFreeString => deliveryFree(subtotal).toStringAsFixed(2);

  String freeDelivery(subtotal) {
    if (subtotal >= 100.0) {
      return 'You have Free Delivery';
    } else {
      double missing = 30.0 - subtotal;
      return 'Add \£${missing.toStringAsFixed(2)} for FREE Delivery';
    }
  }

  String get freeDeliveryString => freeDelivery(subtotal);

  double total(subtosubtotal, deliveryFree) {
    return subtotal + deliveryFree(subtotal);
  }

  String get totalString => total(subtotal, deliveryFree).toStringAsFixed(2);

  @override
  List<Object?> get props => [products];
}
