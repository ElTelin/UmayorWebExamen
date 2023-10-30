import 'package:crud/src/provider/Providers.dart';
import 'package:crud/src/services/supplier_service.dart';
import 'package:crud/src/ui/input_decorations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditSupplierScreen extends StatelessWidget {
  const EditSupplierScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final supplierService = Provider.of<SupplierService>(context);
    return ChangeNotifierProvider(
        create: (_) => SupplierFormProvider(supplierService.selectSupplier!),
        child: _SupplierScreenBody(
          supplierService: supplierService,
        ));
  }
}

class _SupplierScreenBody extends StatelessWidget {
  const _SupplierScreenBody({
    Key? key,
    required this.supplierService,
  }) : super(key: key);

  final SupplierService supplierService;
  @override
  Widget build(BuildContext context) {
    final supplierForm = Provider.of<SupplierFormProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edicion De Proveedores'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          _SupplierForm(),
        ]),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            tooltip: 'volver a lista de proveedores',
            onPressed: (){ 
              Navigator.of(context).pushNamed('supplier_list');
            },
            heroTag: null,
            child: const Icon(Icons.arrow_back),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            tooltip: "guardar cambios",
            onPressed: () async {
              if (!supplierForm.isValidForm()) return;
              await supplierService.editOrCreateSupplier(supplierForm.supplier);
            },
            heroTag: null,
            child: const Icon(Icons.save_as),
          ),
           const SizedBox(width: 20),
          FloatingActionButton(
            tooltip: "eliminar proveedor",
            onPressed: () async {
              if (!supplierForm.isValidForm()) return;
              await supplierService.deleteService(supplierForm.supplier, context);
            },
            heroTag: null,
            child: const Icon(Icons.delete_forever),
          ),
          
        ],
      ),
    );
  }
}

class _SupplierForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final supplierForm = Provider.of<SupplierFormProvider>(context);
    final supplier = supplierForm.supplier;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: _createDecoration(),
        child: Form(
          key: supplierForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                initialValue: supplier.supplierName,
                onChanged: (value) => supplier.supplierName = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'el nombre es obligatorio';
                  }
                  return null;
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Nombre',
                  labelText: 'Nombre',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: supplier.supplierLastName,
                onChanged: (value) => supplier.supplierLastName = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'el apellido es obligatorio';
                  }
                  return null;
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Apellido',
                  labelText: 'Apellido',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: supplier.supplierEmail,
                onChanged: (value) => supplier.supplierEmail = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'el email es obligatorio';
                  }
                  return null;
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Email',
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 20),
              SwitchListTile.adaptive(
                value: true,
                onChanged: (value) {},
                activeColor: Colors.orange,
                title: const Text('Disponible'),
              )
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _createDecoration() => const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 5),
              blurRadius: 10,
            )
          ]);
}
