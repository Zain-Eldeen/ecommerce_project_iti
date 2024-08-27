import 'package:e_commerce_app/Screens/SplashScreen.dart';
import 'package:e_commerce_app/blocks/GetProductBlock/get_product_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/Services/products_services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => ProductBloc(productRepository: ProductRepository()),
        child: SplashScreen(),
      ),
    );
  }
}
