import 'package:crud/src/model/supplier.dart';
import 'package:flutter/material.dart';

class SupplierCard extends StatelessWidget {
  final Listado supplier;
  const SupplierCard({Key? key, required this.supplier}) : super(key: key);

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
          buildSeupplierLine("Nombre",supplier.supplierName),
          const SizedBox(height: 20),
          buildSeupplierLine("Appellido",supplier.supplierLastName),
          const SizedBox(height: 20),
          buildSeupplierLine("Email",supplier.supplierEmail),
          const SizedBox(height: 20),
          buildSeupplierLine("Estado",supplier.supplierState),
          const SizedBox(height: 20),
        ]),
      ),
    );
  }

  Row buildSeupplierLine(String title,String value) {
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

class _State extends StatelessWidget {
  final Listado supplier;

  const _State({Key? key, required this.supplier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(supplier.supplierState,
                style: TextStyle(fontSize: 20, color: Colors.white))),
      ),
      width: 100,
      height: 70,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
    );
  }
}

class _SupplierDetails extends StatelessWidget {
  final Listado supplier;

  const _SupplierDetails({Key? key, required this.supplier}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 80,
        decoration: _boxDecorations(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              supplier.supplierName,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              supplier.supplierLastName,
              style: TextStyle(fontSize: 15, color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              supplier.supplierEmail,
              style: TextStyle(fontSize: 15, color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecorations() => const BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), topRight: Radius.circular(25)));
}
