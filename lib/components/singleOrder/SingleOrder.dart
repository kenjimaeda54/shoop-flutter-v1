import "package:flutter/material.dart";
import 'package:shopp/models/OrderModel.dart';
import "package:intl/intl.dart";

class SingleOrder extends StatelessWidget {
  final OrderModel order;

  const SingleOrder(this.order, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("R\$ ${order.total.toStringAsFixed(2)}"),
        subtitle: Text(DateFormat("dd/MM/yyyy  HH:mm").format(order.date)),
        trailing: const Icon(Icons.expand_more),
      ),
    );
  }
}
