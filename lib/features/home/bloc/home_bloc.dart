import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery/data/cart_items.dart';
import 'package:grocery/data/grocery_data.dart';
import 'package:grocery/data/wish_list_items.dart';
import 'package:grocery/features/home/model/home_product_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeCartNavigateEvent>(homeCartNavigateEvent);
    on<HomeWishedlistNavigateEvent>(homeWishedlistNavigateEvent);

    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishedlistButtonClickedEvent>(homeProductWishedlistButtonClickedEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    List<HomeProductModel> products = GroceryData.groceryData
        .map((element) => HomeProductModel(
              id: element['id'],
              name: element['name'],
              description: element['description'],
              price: element['price'],
              imageUrl: element['imageUrl'],
            ))
        .toList();
    emit(
      HomeLoadingSuccessState(
        poducts: products,
      ),
    );
  }

  FutureOr<void> homeCartNavigateEvent(HomeCartNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeWishedlistNavigateEvent(HomeWishedlistNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    bool isCarted;
    if (cartItems.contains(event.clickedProduct)) {
      cartItems.remove(event.clickedProduct);
      isCarted = false;
    } else {
      cartItems.add(event.clickedProduct);
      isCarted = true;
    }

    emit(HomeProductCartItemActionState(isCarted: isCarted));
  }

  FutureOr<void> homeProductWishedlistButtonClickedEvent(HomeProductWishedlistButtonClickedEvent event, Emitter<HomeState> emit) {
    bool isWisheditem;
    if (wishListItems.contains(event.clickedProduct)) {
      wishListItems.remove(event.clickedProduct);
      isWisheditem = false;
    } else {
      wishListItems.add(event.clickedProduct);
      isWisheditem = true;
    }
    emit(HomeProductWishedListItemActionState(isWishListed: isWisheditem));
  }
}
