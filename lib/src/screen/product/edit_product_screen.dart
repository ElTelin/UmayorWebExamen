

import 'package:crud/src/provider/Providers.dart';
import 'package:crud/src/services/product_service.dart';
import 'package:crud/src/ui/input_decorations.dart';
import 'package:crud/src/widgets/product_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class EditProductScreen extends StatelessWidget {
  const EditProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    return ChangeNotifierProvider(
        create: (_) => ProductFormProvider(productService.selectProduct!),
        child: _ProductScreenBody(
          productService: productService,
        ));
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductService productService;
  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edicion De Productos'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              ProductImage(
                url: productService.selectProduct!.productImage,
              ),
              Positioned(
                top: 100,
                left: 20,
                child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 40,
                      color: Colors.white,
                    )),
              ),
              Positioned(
                top: 40,
                right: 20,
                child: IconButton(
                    onPressed: () => {},
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      size: 40,
                      color: Colors.white,
                    )),
              )
            ],
          ),
          _ProductForm(),
        ]),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            tooltip: 'volver a lista de productos',
            onPressed: (){ 
              Navigator.of(context).pushNamed('product_list');
            },
            heroTag: null,
            child: const Icon(Icons.arrow_back),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            tooltip: "guardar cambios",
            onPressed: () async {
              if (!productForm.isValidForm()) return;
              await productService.editOrCreateProduct(productForm.product);
            },
            heroTag: null,
            child: const Icon(Icons.save_as),
          ),
           const SizedBox(width: 20),
          FloatingActionButton(
            tooltip: "eliminar producto",
            onPressed: () async {
              if (!productForm.isValidForm()) return;
              await productService.deleteProduct(productForm.product, context);
            },
            heroTag: null,
            child: const Icon(Icons.delete_forever),
          ),
          
        ],
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: _createDecoration(),
        child: Form(
          key: productForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                initialValue: product.productName,
                onChanged: (value) => product.productName = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'el nombre es obligatorio';
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Nombre del producto',
                  labelText: 'Nombre',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                initialValue: product.productPrice.toString(),
                onChanged: (value) {
                  if (int.tryParse(value) == null) {
                    product.productPrice = 0;
                  } else {
                    product.productPrice = int.parse(value);
                  }
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: '-----',
                  labelText: 'Precio',
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
