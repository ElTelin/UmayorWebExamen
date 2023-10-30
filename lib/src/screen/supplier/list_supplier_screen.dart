import 'package:crud/src/model/supplier.dart';
import 'package:crud/src/screen/loading_screen.dart';
import 'package:crud/src/services/supplier_service.dart';
import 'package:crud/src/widgets/suppler_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupplierListScreen extends StatelessWidget {
  const SupplierListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final supplierService = Provider.of<SupplierService>(context);
    if (supplierService.isLoading) return const LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Proveedores'),
        leading:  GestureDetector(
          onTap: (){Navigator.of(context).pushNamed('crud_list');},
          child: const Icon(Icons.arrow_back,),
        ),
      ),
      body: ListView.builder(
        itemCount: supplierService.suppliers.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            supplierService.selectSupplier =
                supplierService.suppliers[index].copy();
            Navigator.pushNamed(context, 'edit_supplier');
          },
          child: SupplierCard(supplier: supplierService.suppliers[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          supplierService.selectSupplier = Listado(
              supplierId: 0,
              supplierName: '',
              supplierLastName: '',
              supplierEmail:'',
              supplierState: '');
          Navigator.pushNamed(context, 'edit_supplier');
        },
      ),
    );
  }
}


