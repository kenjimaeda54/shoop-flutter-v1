class CardProductModel {
  final String id;
  final String productId;
  final String name;
  final int quantity;
  final double price;

  CardProductModel(
      {required this.name,
      required this.price,
      required this.id,
      required this.quantity,
      required this.productId});
}
