import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/home/ui/product_tile_widget.dart';
import 'package:grocery/features/wished_list/bloc/wishedlist_bloc.dart';
import 'package:grocery/utils/utils.dart';

class WishedList extends StatefulWidget {
  const WishedList({super.key});

  @override
  State<WishedList> createState() => _CartState();
}

class _CartState extends State<WishedList> {
  final WishedlistBloc wishedlistBloc = WishedlistBloc();

  @override
  void initState() {
    wishedlistBloc.add(WishedlistInitialEvent());
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
        title: const Text('Favorite'),
      ),
      body: BlocConsumer<WishedlistBloc, WishedlistState>(
        bloc: wishedlistBloc,
        listenWhen: (previous, current) => current is WishedlistActionState,
        buildWhen: (previous, current) => current is! WishedlistActionState,
        listener: (context, state) {
          if (state is WishedlistProductCartItemActionState) {
            Utils.customSnackBar(
              isAdding: state.isCarted,
              context: context,
              content: state.isCarted ? 'Item Added To Cart' : 'Item Deleted From Cart',
            );
          } else if (state is WishedlistProductWishedListItemActionState) {
            Utils.customSnackBar(
              isAdding: false,
              context: context,
              content: 'Item Removed From Wished List',
            );
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishedlistSuccessState:
              final successState = state as WishedlistSuccessState;
              if (state.wishedList.isEmpty) {
                return const Center(
                  child: Text("No items"),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.only(bottom: 12),
                itemBuilder: (context, index) => ProductTileWidget(
                  bloc: wishedlistBloc,
                  productModel: successState.wishedList[index],
                  isWishedList: true,
                ),
                itemCount: successState.wishedList.length,
              );
            default:
              return const Center(
                child: Text("No items"),
              );
          }
        },
      ),
    );
  }
}
