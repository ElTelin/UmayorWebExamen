import 'package:crud/src/screen/category/edit_category_screen.dart';
import 'package:crud/src/screen/category/list_category_screen.dart';
import 'package:crud/src/screen/crud_element_screen.dart';
import 'package:crud/src/screen/error_screen.dart';
import 'package:crud/src/screen/login_screen.dart';
import 'package:crud/src/screen/product/edit_product_screen.dart';
import 'package:crud/src/screen/product/list_product_screen.dart';
import 'package:crud/src/screen/register_user_screen.dart';
import 'package:crud/src/screen/supplier/edit_supplier_screen.dart';
import 'package:crud/src/screen/supplier/list_supplier_screen.dart';
import 'package:flutter/material.dart';



class RouterApp {
  static const initialRoute = 'login';
  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => const LoginScreen(),
    'product_list': (BuildContext context) => const ListProductScreen(),
    'edit_product': (BuildContext context) => const EditProductScreen(),
    'create_user':(BuildContext context) => const RegisterUserScreen(),
    'crud_list' :(BuildContext context) => const CrudElementList(),
    'supplier_list': (BuildContext context) => const SupplierListScreen(),
    'edit_supplier': (BuildContext context) => const EditSupplierScreen(),
    'category_list': (BuildContext context) => const CategoryListScreen(),
    'edit_category': (BuildContext context) => const EditCategoryScreen(),
    
    
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const ErrorScreen(),
    );
  }
}
