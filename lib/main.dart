import 'package:flutter/material.dart';
import 'package:products/pages/home_page.dart';
import 'package:products/pages/login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Products',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'login': (context) => const LoginPage(),
        'home': (context) => const HomePage(),
      },
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[300],
          appBarTheme: const AppBarTheme(elevation: 0, color: Colors.purple),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              elevation: 0, backgroundColor: Colors.purple)),
    );
  }
}
