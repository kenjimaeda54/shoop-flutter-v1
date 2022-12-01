# Shoop 
Aplciacao para entender Provider do flutter
E possivel selecionar os favoritos,colocar no carrinho e consultar os comparados


## Feature
- Usei Provider como gerenciador de estados
- Utilizei o mixin ChangeNotifier do Provider
- Flutter nao aceita multipla heranca, mas Mixin permite existir varios
- Mixin a ideia e criar suas funcionalidades e a classe que vai usar com a palavra with basicaimetne ira colcar essa funcionalidades nela
- Primeior envolvi toda minha aplicacao com meu provider assim toda aplicacao tem acesso aos dados
- Para recuperar todos criei um metodo com spread operator,assim estou retornaod a lista original e nao uma referencia
- Quando adiconar ou remover tenho que garantir que seja na lista oirginal
- Ele utiliza do conceito do observer por isso preciso notificar as mudancas
- 

```dart
//main
 MultiProvider(
      //precisa importar o import 'package:provider/provider.dart';
      //do pacote de provider
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
- Quando for usar o provider apenas istancio com o contexto
- Posso em algum momenot usar o mesmo provider em outros lugares e notificar como eu fiz no ProductGrid
- Assim preciso passar dados via construtor ou rota
- Repare que estou disponibilizando um novo provider em  ChangeNotifierProvider.value
- Na proxima tela eu apenas instancio o provider ele esta pronto para uso
- Posso usar o listner como false assim essa arvore nao sofre um novo render caso o provider mude

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
- Caso eu deseje que ocorra mudancas na arvore apos uma notificao de um provider posso usar o consumer
- No exemplo abaixo conforme clica no icone de carrinho aumento o numero de compras no badge, isso e possivel com conusmer
- Ultimo parametor e o child ele e reponsavel por indicar qual arvore e estatica ou seja nao sofre render
- Toda vez que aumentar o numero de itens no CartProcutProvider esse consumer sera notificao e renderizara o numero de itemCount

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



