import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery/data/cart_items.dart';
import 'package:grocery/data/wish_list_items.dart';
import 'package:grocery/features/home/model/home_product_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartProductCartButtonClickedEvent>(cartProductCartButtonClickedEvent);
    on<CartProductWishedlistButtonClickedEvent>(cartProductWishedlistButtonClickedEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartProductCartButtonClickedEvent(CartProductCartButtonClickedEvent event, Emitter<CartState> emit) {
    bool isCarted;
    if (cartItems.contains(event.clickedProduct)) {
      cartItems.remove(event.clickedProduct);
      isCarted = false;
    } else {
      cartItems.add(event.clickedProduct);
      isCarted = true;
    }

    emit(CartProductCartItemActionState(isCarted: isCarted));
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartProductWishedlistButtonClickedEvent(CartProductWishedlistButtonClickedEvent event, Emitter<CartState> emit) {
    bool isWisheditem;
    if (wishListItems.contains(event.clickedProduct)) {
      wishListItems.remove(event.clickedProduct);
      isWisheditem = false;
    } else {
      wishListItems.add(event.clickedProduct);
      isWisheditem = true;
    }
    emit(CartProductWishedListItemActionState(isWishListed: isWisheditem));
  }
}
