import "CartProductModel.dart";

class OrderModel {
  final String id;
  final double total;
  final List<CartProductModel> cart;
  final DateTime date;

  OrderModel({
    required this.id,
    required this.total,
    required this.cart,
    required this.date,
  });
}
