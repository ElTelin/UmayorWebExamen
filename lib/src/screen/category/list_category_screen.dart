import 'package:crud/src/model/category.dart';
import 'package:crud/src/screen/loading_screen.dart';
import 'package:crud/src/services/category_service.dart';
import 'package:crud/src/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final categoryService = Provider.of<CategoryService>(context);
    if (categoryService.isLoading) return const LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Categorias'),
        leading:  GestureDetector(
          onTap: (){Navigator.of(context).pushNamed('crud_list');},
          child: const Icon(Icons.arrow_back,),
        ),
      ),
      body: ListView.builder(
        itemCount: categoryService.categories.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            categoryService.selectCategory =
                categoryService.categories[index].copy();
            Navigator.pushNamed(context, 'edit_category');
          },
          child: CategoryCard(category: categoryService.categories[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          categoryService.selectCategory = Listado(
              categoryId: 0,
              categoryName: '',
              categoryState: '');
          Navigator.pushNamed(context, 'edit_category');
        },
      ),
    );
  }
}


