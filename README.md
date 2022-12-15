# Shoop 
Aplicação para entender Provider do flutter</br>
E possível selecionar os favoritos,consultar, colocar no carrinho e consultar os comparados


## Feature
- Usei Provider como gerenciador de estados
- Utilizei o mixin ChangeNotifier do Provider
- Flutter não aceita múltipla herança, mas Mixin permite existir vários
- Mixin a ideia e criar suas funcionalidades e a classe que vai usar com a palavra with basicamente ira colar essas funcionalidades nela
- Primeiro envolvi toda minha aplicação com meu Multi Provider assim toda aplicação tem acesso aos dados
- Para recuperar todos criei um método com spread operator, assim estou retornado a lista original e não uma referência
- Quando adicionar ou remover tenho que garantir que seja na lista original
- Ele utiliza do conceito do observer, então a cada alteração  preciso notificar as mudanças



```dart
//main
 MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductListProvider()),
        ChangeNotifierProvider(create: (_) => CartProductProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider())
      ],

  ...resto do main dart
)


//provider
class ProductListProvider with ChangeNotifier {
  final List<ProductModel> _products = mockShop
  List<ProductModel> getItens() => [..._products];

  List<ProductModel> getItensFilter() =>
      mockShop.where((it) => it.isFavorite).toList();

  void addProdct(ProductModel product) {
    _products.add(product);
    notifyListeners();
  }
}


```

## 
- Quando for usar o provider apenas estancio com o contexto
- Posso em algum momento usar o mesmo provider em outros lugares e notificar como eu fiz no ProductGrid
- Assim não preciso passar dados via construtor ou rota
- Repare que estou disponibilizando um novo provider em  ChangeNotifierProvider.value
- Na próxima tela eu apenas instancio o provider ele está pronto para uso
- Posso usar o listner como false assim essa arvore não sofre um novo render caso o provider mude

```dart
//single cart
 CartProductProvider cartProvider = Provider.of(context);
 
 
//ProductGrid
 ChangeNotifierProvider.value(
                value: products[index], child: const SingleShop()));

//SingleShop
 final product = Provider.of<ProductModel>(context, listen: false);
 final cart = Provider.of<CartProductProvider>(context, listen: false);

```
 
##
- Caso eu deseje que ocorra mudanças na árvore apos uma notificação de um provider posso usar o consumer
- No exemplo abaixo, conforme clica no icone de carrinho, aumenta o número de compras no badge, isso e possível com conusmer
- Ultimo paramento e o child ele e responsável por indicar qual arvore e estática, ou seja, não sofre render
- Toda vez que aumentar o número de itens no CartProcutProvider esse consumer serao notificado e renderizara o número de itemCount

```dart
  Consumer<CartProductProvider>(
            child: IconButton(
                onPressed: handleNavigation,
                icon: const Icon(Icons.shopping_cart)),
            builder: (ctx, card, child) =>
                Badge(
                  value: "${card.itemCount}",
                  child: child!,
                ),
          )



```

## 
- Para adicionar sempre no inicio usei metodo insert passando index


```dart

void addOder(CartProductProvider cart) {
    _order.insert(
      0,
      OrderModel(
          id: "${Random().nextDouble()}-${_order.length}-${Random().nextDouble()}",
          total: cart.shouldReturnTotalPrice,
          //values e os valores da chave do dicionario ou seja o proprio Cart
          products: cart.getAllProcut().values.toList(),
          date: DateTime.now()),
    );
  }


```

