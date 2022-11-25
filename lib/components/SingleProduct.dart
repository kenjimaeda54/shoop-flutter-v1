import 'package:flutter/material.dart';
import 'package:shopp/utils/ConstantsRoutes.dart';
import '../models/ProductModel.dart';

class SingleShop extends StatelessWidget {
  final ProductModel product;

  const SingleShop(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    void handleNavigation() {
      Navigator.of(context)
          .pushNamed(ConstantRoutes.productDetail, arguments: product);
    }

    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black87,
        title: Text(
          product.title,
          textAlign: TextAlign.center,
        ),
        leading: Icon(
          Icons.favorite,
          color: Theme.of(context).colorScheme.secondary,
        ),
        trailing: Icon(Icons.shopping_cart,
            color: Theme.of(context).colorScheme.secondary),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: GestureDetector(
            onTap: handleNavigation,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
