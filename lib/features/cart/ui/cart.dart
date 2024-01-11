import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/cart/bloc/cart_bloc.dart';
import 'package:grocery/features/home/ui/product_tile_widget.dart';
import 'package:grocery/utils/utils.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white60,
          ),
        ),
        title: const Text('Cart'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
          if (state is CartProductCartItemActionState) {
            Utils.customSnackBar(
              isAdding: false,
              context: context,
              content: 'Item Removed From Cart',
            );
          } else if (state is CartProductWishedListItemActionState) {
            Utils.customSnackBar(
              isAdding: state.isWishListed,
              context: context,
              content: state.isWishListed ? 'Item Added To Wished List' : 'Item Removed From Wished List',
            );
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                itemBuilder: (context, index) => ProductTileWidget(
                  bloc: cartBloc,
                  productModel: successState.cartItems[index],
                  isCart: true,
                ),
                itemCount: successState.cartItems.length,
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
