part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}


class HomeCartNavigateEvent extends HomeEvent{}

class HomeWishedlistNavigateEvent extends HomeEvent{}

 

class HomeProductCartButtonClickedEvent extends HomeEvent{}

class HomeProductWishedlistButtonClickedEvent extends HomeEvent{}