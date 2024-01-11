import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery/data/cart_items.dart';
import 'package:grocery/data/wish_list_items.dart';
import 'package:grocery/features/home/model/home_product_model.dart';
import 'package:meta/meta.dart';

part 'wishedlist_event.dart';
part 'wishedlist_state.dart';

class WishedlistBloc extends Bloc<WishedlistEvent, WishedlistState> {
  WishedlistBloc() : super(WishedlistInitial()) {
    on<WishedlistInitialEvent>(wishedlistInitialEvent);
    on<WishedlistProductCartButtonClickedEvent>(wishedlistProductCartButtonClickedEvent);
    on<WishedlistProductWishedlistButtonClickedEvent>(wishedlistProductWishedlistButtonClickedEvent);
  }

  FutureOr<void> wishedlistInitialEvent(WishedlistInitialEvent event, Emitter<WishedlistState> emit) {
    emit(WishedlistSuccessState(wishedList: wishListItems));
  }

  FutureOr<void> wishedlistProductCartButtonClickedEvent(
      WishedlistProductCartButtonClickedEvent event, Emitter<WishedlistState> emit) {
    bool isCarted;
    if (cartItems.contains(event.clickedProduct)) {
      cartItems.remove(event.clickedProduct);
      isCarted = false;
    } else {
      cartItems.add(event.clickedProduct);
      isCarted = true;
    }

    emit(WishedlistProductCartItemActionState(isCarted: isCarted));
  }

  FutureOr<void> wishedlistProductWishedlistButtonClickedEvent(
      WishedlistProductWishedlistButtonClickedEvent event, Emitter<WishedlistState> emit) {
    bool isWisheditem;
    if (wishListItems.contains(event.clickedProduct)) {
      wishListItems.remove(event.clickedProduct);
      isWisheditem = false;
    } else {
      wishListItems.add(event.clickedProduct);
      isWisheditem = true;
    }
    emit(WishedlistProductWishedListItemActionState(isWishListed: isWisheditem));
    emit(WishedlistSuccessState(wishedList: wishListItems));
  }
}
