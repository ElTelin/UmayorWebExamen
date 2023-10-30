import 'package:crud/src/model/supplier.dart';
import 'package:flutter/material.dart';

class SupplierFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Listado supplier;
  SupplierFormProvider(this.supplier);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
