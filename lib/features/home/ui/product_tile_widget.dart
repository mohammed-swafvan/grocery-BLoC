import 'package:bloc/bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery/data/cart_items.dart';
import 'package:grocery/data/wish_list_items.dart';
import 'package:grocery/features/cart/bloc/cart_bloc.dart';
import 'package:grocery/features/home/bloc/home_bloc.dart';
import 'package:grocery/features/home/model/home_product_model.dart';
import 'package:grocery/features/wished_list/bloc/wishedlist_bloc.dart';

class ProductTileWidget extends StatefulWidget {
  const ProductTileWidget({
    super.key,
    required this.productModel,
    required this.bloc,
    this.isCart = false,
    this.isWishedList = false,
  });
  final Bloc bloc;
  final HomeProductModel productModel;
  final bool isCart;
  final bool isWishedList;

  @override
  State<ProductTileWidget> createState() => _ProductTileWidgetState();
}

class _ProductTileWidgetState extends State<ProductTileWidget> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(8).copyWith(bottom: 0),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black38,
            width: 1.5,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Wrap(
            direction: Axis.horizontal,
            spacing: 16,
            children: [
              InkWell(
                onTap: () {
                  if (widget.isCart) {
                    widget.bloc.add(CartProductWishedlistButtonClickedEvent(clickedProduct: widget.productModel));
                  } else if (widget.isWishedList) {
                    widget.bloc.add(WishedlistProductWishedlistButtonClickedEvent(clickedProduct: widget.productModel));
                  } else {
                    widget.bloc.add(HomeProductWishedlistButtonClickedEvent(clickedProduct: widget.productModel));
                  }
                  setState(() {});
                },
                child: wishListItems.contains(widget.productModel)
                    ? const Icon(
                        Icons.favorite_border_outlined,
                        size: 20,
                        color: Colors.teal,
                      )
                    : const Icon(
                        Icons.favorite_border_outlined,
                        size: 20,
                        color: Colors.black,
                      ),
              ),
              InkWell(
                onTap: () {
                  if (widget.isCart) {
                    widget.bloc.add(CartProductCartButtonClickedEvent(clickedProduct: widget.productModel));
                  } else if (widget.isWishedList) {
                    widget.bloc.add(WishedlistProductCartButtonClickedEvent(clickedProduct: widget.productModel));
                  } else {
                    widget.bloc.add(HomeProductCartButtonClickedEvent(clickedProduct: widget.productModel));
                  }

                  setState(() {});
                },
                child: cartItems.contains(widget.productModel)
                    ? const Icon(
                        Icons.shopping_bag_outlined,
                        size: 20,
                        color: Colors.teal,
                      )
                    : const Icon(
                        Icons.shopping_bag_outlined,
                        size: 20,
                        color: Colors.black,
                      ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: screenWidth / 3.5,
                    height: screenWidth / 3.5,
                    child: CachedNetworkImage(
                      imageUrl: widget.productModel.imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) {
                        return SizedBox(
                          width: screenWidth / 3.5,
                          height: screenWidth / 3.5,
                          child: const Center(
                            child: SizedBox(
                              height: 34,
                              width: 34,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Text(
                    widget.productModel.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productModel.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.productModel.description,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "\$ ${widget.productModel.price}",
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
