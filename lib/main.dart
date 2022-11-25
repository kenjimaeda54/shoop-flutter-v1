import 'package:flutter/material.dart';
import 'package:shopp/screen/Home.dart';
import 'package:shopp/screen/ProductDetail.dart';
import 'package:shopp/utils/ConstantsRoutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Lato",
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.deepOrange,
          )),
      home: Home(),
      debugShowCheckedModeBanner: false,
      routes: {ConstantRoutes.productDetail: (_) => const ProductDetails()},
    );
  }
}
