import 'package:flutter/material.dart';
import 'package:shopp/models/ProductModel.dart';
import '../components/SingleProduct.dart';
import '../data/produtos.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  List<ProductModel> products = mockShop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Minha loja"),
        ),
        body: GridView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (ctx, index) => SingleShop(products[index])));
  }
}
