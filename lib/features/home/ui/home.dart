import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:grocery/features/cart/ui/cart.dart';
import 'package:grocery/features/home/bloc/home_bloc.dart';
import 'package:grocery/features/home/ui/product_tile_widget.dart';
import 'package:grocery/features/wished_list/ui/wished_list.dart';
import 'package:grocery/utils/utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Cart()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const WishedList()));
        } else if (state is HomeProductCartItemActionState) {
          Utils.customSnackBar(
            isAdding: state.isCarted,
            context: context,
            content: state.isCarted ? 'Item Added To Cart' : 'Item Removed From Cart',
          );
        } else if (state is HomeProductWishedListItemActionState) {
          Utils.customSnackBar(
            isAdding: state.isWishListed,
            context: context,
            content: state.isWishListed ? 'Item Added To Wished List' : 'Item Removed From Wished List',
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadingSuccessState:
            final successState = state as HomeLoadingSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Grocery App'),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishedlistNavigateEvent());
                    },
                    icon: const Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartNavigateEvent());
                    },
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              body: ListView.builder(
                itemBuilder: (context, index) => ProductTileWidget(bloc: homeBloc, productModel: successState.poducts[index]),
                itemCount: successState.poducts.length,
              ),
            );
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text('Something went wrong'),
              ),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
