part of 'wishedlist_bloc.dart';

@immutable
sealed class WishedlistEvent {}

class WishedlistInitialEvent extends WishedlistEvent {}

class WishedlistProductCartButtonClickedEvent extends WishedlistEvent {
  final HomeProductModel clickedProduct;

  WishedlistProductCartButtonClickedEvent({required this.clickedProduct});
}

class WishedlistProductWishedlistButtonClickedEvent extends WishedlistEvent {
  final HomeProductModel clickedProduct;

  WishedlistProductWishedlistButtonClickedEvent({required this.clickedProduct});
}
