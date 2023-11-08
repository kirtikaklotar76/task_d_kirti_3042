import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_d_kirti_3042/controllers/products_controller.dart';
import 'package:task_d_kirti_3042/views/screens/cartPage.dart';
import 'package:task_d_kirti_3042/views/screens/favouritePage.dart';
import 'package:task_d_kirti_3042/views/screens/homePage.dart';
import 'package:task_d_kirti_3042/views/screens/productDetailedPage.dart';
import 'package:task_d_kirti_3042/views/screens/splashScreen.dart';
import 'package:task_d_kirti_3042/views/utils/routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ShopIn",
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: MyRoutes.spalshScreen,
      routes: {
        MyRoutes.homepage: (context) => HomePage(),
        MyRoutes.spalshScreen: (context) => SplashScreen(),
        MyRoutes.productDetailedPage: (context) => ProductDetailedPage(),
        MyRoutes.favouritePage: (context) => FavouritePage(),
        MyRoutes.cartPage: (context) => CartPage(),
      },
    );
  }
}
