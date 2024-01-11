part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

sealed class CartActionState extends CartState {}

final class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<HomeProductModel> cartItems;

  CartSuccessState({required this.cartItems});
}


class CartProductCartItemActionState extends CartActionState {
  final bool isCarted;

  CartProductCartItemActionState({required this.isCarted});
}

class CartProductWishedListItemActionState extends CartActionState {
  final bool isWishListed;

  CartProductWishedListItemActionState({required this.isWishListed});

}