import 'package:flutter/material.dart';

class CrudElementList extends StatelessWidget {
  const CrudElementList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elementos Editables'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 40),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('product_list');
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(
                            30), 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), 
                        ),
                        backgroundColor: Colors.orange 
                        ),
                    child: const Text(
                      'Productos',
                      style: TextStyle(fontSize: 20),
                    )),
                const SizedBox(height: 40),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('category_list');
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(
                            30), 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), 
                        ),
                        backgroundColor: Colors.orange 
                        ),
                    child: const Text(
                      'Categorias',
                      style: TextStyle(fontSize: 20),
                    )),
                const SizedBox(height: 40),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('supplier_list');
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), 
                        ),
                        backgroundColor: Colors.orange 
                        ),
                    child: const Text(
                      'Proveedores',
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
