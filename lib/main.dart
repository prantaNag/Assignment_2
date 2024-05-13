import 'package:assignment2/homeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CartApp());
}

class CartApp extends StatefulWidget {
  const CartApp({super.key});

  @override
  State<CartApp> createState() => _CartAppState();
}

class _CartAppState extends State<CartApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF9F9F9),
      ),
    );
  }
}
