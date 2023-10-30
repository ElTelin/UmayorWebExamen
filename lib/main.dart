import 'package:crud/src/routes/router.dart';
import 'package:crud/src/services/auth_service.dart';
import 'package:crud/src/services/category_service.dart';
import 'package:crud/src/services/product_service.dart';
import 'package:crud/src/services/supplier_service.dart';
import 'package:crud/src/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => ProductService()),
        ChangeNotifierProvider(create: (_) => SupplierService()),
        ChangeNotifierProvider(create: (_) => CategoryService())
      ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Examen Aplicacion Web',
      initialRoute: RouterApp.initialRoute,
      routes: RouterApp.routes,
      onGenerateRoute: RouterApp.onGenerateRoute,
      theme: MyTheme.myTheme,
    );
  }
}
