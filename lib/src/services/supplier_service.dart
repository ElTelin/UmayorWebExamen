import 'package:crud/src/model/supplier.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class SupplierService extends ChangeNotifier {
  final String _baseUrl = '143.198.118.203:8000';
  final String _user = 'test';
  final String _pass = 'test2023';

  List<Listado> suppliers = [];
  Listado? selectSupplier;
  bool isLoading = true;
  bool isEditCreate = true;

  SupplierService() {
    loadSupplier();
  }
  Future loadSupplier() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_list_rest/',
    );
    print("previous supplier");
    
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.get(url, headers: {'authorization': basicAuth});
    print(response.body);
    final supplierMap = Supplier.fromJson(response.body);
    print(response.body);
    suppliers = supplierMap.listado;
    isLoading = false;
    notifyListeners();
  }

  Future editOrCreateSupplier(Listado supplier) async {
    isEditCreate = true;
    notifyListeners();
    if (supplier.supplierId == 0) {
      await createSupplier(supplier);
    } else {
      await updateSupplier(supplier);
    }

    isEditCreate = false;
    notifyListeners();
  }

  Future<String> updateSupplier(Listado supplier) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_edit_rest/',
    );
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(url, body: supplier.toJson(), headers: {
      'authorization': basicAuth,
      'Content-Type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);

    //actualizamos el listado
    final index = suppliers
        .indexWhere((element) => element.supplierId == supplier.supplierId);
    suppliers[index] = supplier;

    return '';
  }

  Future createSupplier(Listado service) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_add_rest/',
    );
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(url, body: service.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);
    suppliers.add(service);
    return '';
  }

  Future deleteService(Listado service, BuildContext context) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/provider_del_rest/',
    );
    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    final response = await http.post(url, body: service.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);
    suppliers.clear(); //borra todo el listado
    loadSupplier();
    Navigator.of(context).pushNamed('supplier_list');
    return '';
  }
}
