import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:grocery/features/cart/ui/cart.dart';
import 'package:grocery/features/home/bloc/home_bloc.dart';
import 'package:grocery/features/wished_list/ui/wished_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = HomeBloc();
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Cart()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const WishedList()));
        }
      },
      builder: (context, state) {
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
          body: Container(),
        );
      },
    );
  }
}
