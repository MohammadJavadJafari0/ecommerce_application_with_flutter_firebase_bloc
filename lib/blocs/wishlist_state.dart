part of 'wishlist_bloc.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();

  @override
  List<Object?> get props => [];
}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistLoading {
  final Wishlist wishlist;

  WishlistLoaded({this.wishlist = const Wishlist()});

  @override
  List<Object?> get props => [wishlist];
}

class WishlistError extends WishlistLoading {}
