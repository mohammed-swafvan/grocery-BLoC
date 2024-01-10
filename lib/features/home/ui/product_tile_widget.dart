import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery/features/home/bloc/home_bloc.dart';
import 'package:grocery/features/home/model/home_product_model.dart';

class ProductTileWidget extends StatelessWidget {
  const ProductTileWidget({super.key, required this.productModel, required this.homeBloc});
  final HomeBloc homeBloc;
  final HomeProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(10).copyWith(bottom: 0),
      padding: const EdgeInsets.all(16),
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
                  homeBloc.add(HomeProductWishedlistButtonClickedEvent(clickedProduct: productModel));
                },
                child: const Icon(
                  Icons.favorite_border_outlined,
                  size: 20,
                ),
              ),
              InkWell(
                onTap: () {
                  homeBloc.add(HomeProductCartButtonClickedEvent(clickedProduct: productModel));
                },
                child: const Icon(
                  Icons.shopping_bag_outlined,
                  size: 20,
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
                      imageUrl: productModel.imageUrl,
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
                    productModel.name,
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
                      productModel.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      productModel.description,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "\$ ${productModel.price}",
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
