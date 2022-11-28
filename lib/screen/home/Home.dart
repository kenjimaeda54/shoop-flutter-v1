import 'package:flutter/material.dart';

import '../../components/productGrid/ProductGrid.dart';

enum FavoritesOrNo {
  showAll,
  showFavorites,
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _showAllProducts = true;

  void handlePopUpMenu(FavoritesOrNo value) {
    //name ira trazer showAll ou showFavorites pois são as propriedades que estão no enum
    //muito parecido com swift,possuo tambem o hashCode e o index
    setState(() {
      _showAllProducts = value.index == 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Minha loja"),
          actions: [
            PopupMenuButton<FavoritesOrNo>(
                onSelected: (FavoritesOrNo value) => handlePopUpMenu(value),
                itemBuilder: (_) => [
                      const PopupMenuItem(
                        value: FavoritesOrNo.showAll,
                        child: Text("Mostrar todos"),
                      ),
                      const PopupMenuItem(
                        value: FavoritesOrNo.showFavorites,
                        child: Text("Mostrar favoritos"),
                      )
                    ])
          ],
        ),
        body: ProductGrid(_showAllProducts));
  }
}
