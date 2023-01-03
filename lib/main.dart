import 'dart:js';

import 'package:flutter/material.dart';
import 'package:homework2/custom_widget/ItemCart.dart';
import 'package:homework2/provider/badge_provider.dart';
import 'package:homework2/screens/add_product_screen/add_product_screen.dart';
import 'package:homework2/screens/cart_screen/cart_screen.dart';
import 'package:homework2/screens/home_screen/home.dart';
import 'package:homework2/screens/start_screen/body_my_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => BadgeProvider(),
    child: Home(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BodyMyApp(),
      ),
    );
  }
}