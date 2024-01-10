import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeCartNavigateEvent>(homeCartNavigateEvent);
    on<HomeWishedlistNavigateEvent>(homeWishedlistNavigateEvent);

    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishedlistButtonClickedEvent>(homeProductWishedlistButtonClickedEvent);
  }

  FutureOr<void> homeCartNavigateEvent(HomeCartNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeWishedlistNavigateEvent(HomeWishedlistNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishlistPageActionState());
  }


  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> homeProductWishedlistButtonClickedEvent(
      HomeProductWishedlistButtonClickedEvent event, Emitter<HomeState> emit) {}
}
