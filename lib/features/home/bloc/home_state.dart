part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}


final class HomeInitial extends HomeState {}


class HomeLoadingState extends HomeState {}

class HomeLoadingSuccessState extends HomeState {
  final List<HomeProductModel> poducts;

  HomeLoadingSuccessState({required this.poducts});
}


class HomeErrorState extends HomeState {}


class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}


class HomeProductCartItemActionState extends HomeActionState{}
class HomeProductWishedListItemActionState extends HomeActionState{}
