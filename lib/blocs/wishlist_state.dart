part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object?> get props => [];
}

final class Wishlistloading extends WishlistState {}

final class Wishlistloaded extends Wishlistloading {
  final Wishlist wishlist;

  Wishlistloaded({this.wishlist = const Wishlist()});

  @override
  List<Object?> get props => [wishlist];
}

final class WishlistError extends Wishlistloading {}