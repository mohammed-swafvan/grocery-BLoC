part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent{}


class RemoveFromCartEvent extends CartEvent{}


class CartProductCartButtonClickedEvent extends CartEvent {
  final HomeProductModel clickedProduct;

  CartProductCartButtonClickedEvent({required this.clickedProduct});
}

class CartProductWishedlistButtonClickedEvent extends CartEvent {
  final HomeProductModel clickedProduct;

  CartProductWishedlistButtonClickedEvent({required this.clickedProduct});
}