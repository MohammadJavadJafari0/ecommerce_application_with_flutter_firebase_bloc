import 'package:ecommerce_application_with_flutter_firebase_bloc/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({required this.products});

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  double deliveryFee(double subtotal) {
    if (subtotal >= 30) {
      return 0.0;
    } else {
      return 10.0;
    }
  }

  double total(double subtotal, double deliveryFee) {
    return subtotal + deliveryFee;
  }

  String freeDelivery(double subtotal) {
    if (subtotal >= 30) {
      return 'You have Free delivery';
    } else {
      double missing = 30.0 - subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} for Free Delivery';
    }
  }

  String get subtotalString => subtotal.toStringAsFixed(2);
  String get totalString =>
      total(subtotal, deliveryFee(subtotal)).toStringAsFixed(2);
  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String get freeDeliveryString => freeDelivery(subtotal);

  @override
  List<Object?> get props => [products];
}
