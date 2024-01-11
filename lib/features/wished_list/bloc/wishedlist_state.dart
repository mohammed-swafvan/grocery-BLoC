part of 'wishedlist_bloc.dart';

@immutable
sealed class WishedlistState {}

sealed class WishedlistActionState extends WishedlistState {}

final class WishedlistInitial extends WishedlistState {}

class WishedlistSuccessState extends WishedlistState {
  final List<HomeProductModel> wishedList;

  WishedlistSuccessState({required this.wishedList});
}

class WishedlistProductCartItemActionState extends WishedlistActionState {
  final bool isCarted;

  WishedlistProductCartItemActionState({required this.isCarted});
}

class WishedlistProductWishedListItemActionState extends WishedlistActionState {
  final bool isWishListed;

  WishedlistProductWishedListItemActionState({required this.isWishListed});
}
