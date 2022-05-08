import 'package:flutter/material.dart';
import 'package:nike_shoes/nike_shoes_store_app/main_nike_shoes_store_app.dart';
import 'package:nike_shoes/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.ligthTheme,
      initialRoute: 'home',
      routes: {
        'home'    : (_) =>   NikeShoesStoreHome()
      },
    );
  }
}

