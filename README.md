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

```flutter
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
