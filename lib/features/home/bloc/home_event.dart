part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeCartNavigateEvent extends HomeEvent {}

class HomeWishedlistNavigateEvent extends HomeEvent {}

class HomeProductCartButtonClickedEvent extends HomeEvent {
  final HomeProductModel clickedProduct;

  HomeProductCartButtonClickedEvent({required this.clickedProduct});
}

class HomeProductWishedlistButtonClickedEvent extends HomeEvent {
  final HomeProductModel clickedProduct;

  HomeProductWishedlistButtonClickedEvent({required this.clickedProduct});
}
