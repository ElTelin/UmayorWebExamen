import 'package:crud/src/provider/Providers.dart';
import 'package:crud/src/services/category_service.dart';
import 'package:crud/src/ui/input_decorations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditCategoryScreen extends StatelessWidget {
  const EditCategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final categoryService = Provider.of<CategoryService>(context);
    return ChangeNotifierProvider(
        create: (_) => CategoryFormProvider(categoryService.selectCategory!),
        child: _CategoryScreenBody(
          categoryService: categoryService,
        ));
  }
}

class _CategoryScreenBody extends StatelessWidget {
  const _CategoryScreenBody({
    Key? key,
    required this.categoryService,
  }) : super(key: key);

  final CategoryService categoryService;
  @override
  Widget build(BuildContext context) {
    final categoryForm = Provider.of<CategoryFormProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edicion De Categorias'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          _CategoryForm(),
        ]),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            tooltip: 'volver a lista de categorias',
            onPressed: (){ 
              Navigator.of(context).pushNamed('category_list');
            },
            heroTag: null,
            child: const Icon(Icons.arrow_back),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            tooltip: "guardar cambios",
            onPressed: () async {
              if (!categoryForm.isValidForm()) return;
              await categoryService.editOrCreateCategory(categoryForm.category);
            },
            heroTag: null,
            child: const Icon(Icons.save_as),
          ),
           const SizedBox(width: 20),
          FloatingActionButton(
            tooltip: "eliminar categoria",
            onPressed: () async {
              if (!categoryForm.isValidForm()) return;
              await categoryService.deleteService(categoryForm.category, context);
            },
            heroTag: null,
            child: const Icon(Icons.delete_forever),
          ),
          
        ],
      ),
    );
  }
}

class _CategoryForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryForm = Provider.of<CategoryFormProvider>(context);
    final category = categoryForm.category;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: _createDecoration(),
        child: Form(
          key: categoryForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                initialValue: category.categoryName,
                onChanged: (value) => category.categoryName = value,
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
