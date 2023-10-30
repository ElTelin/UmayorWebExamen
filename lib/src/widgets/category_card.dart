import 'package:crud/src/model/category.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Listado category;
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _cardDecorations(),
        child: Column(children: [
          const SizedBox(height: 40),
          buildCategoryLine("Nombre",category.categoryName),
          const SizedBox(height: 20),
          buildCategoryLine("Estado",category.categoryState),
          const SizedBox(height: 20),
        ]),
      ),
    );
  }

  Row buildCategoryLine(String title,String value) {
    return Row(
          children: [
             Expanded(
                child: Text( title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        decorationStyle: TextDecorationStyle.wavy,
                        fontFamily: 'Raleway'))),
            Expanded(
                child: Text(value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        decorationStyle: TextDecorationStyle.wavy,
                        fontFamily: 'Raleway'))),
          ],
        );
  }

  BoxDecoration _cardDecorations() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 5),
              blurRadius: 10,
            )
          ]);
}

