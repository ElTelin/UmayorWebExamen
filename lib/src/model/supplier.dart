import 'dart:convert';

class Supplier {
  Supplier({
    required this.listado,
  });

  List<Listado> listado;

  factory Supplier.fromJson(String str) => Supplier.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Supplier.fromMap(Map<String, dynamic> json) => Supplier(
        listado:
            List<Listado>.from(json["Proveedores Listado"].map((x) => Listado.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Proveedores Listado": List<dynamic>.from(listado.map((x) => x.toMap())),
      };
}

class Listado {
  Listado({
    required this.supplierId,
    required this.supplierName,
    required this.supplierLastName,
    required this.supplierEmail,
    required this.supplierState,
  });

  int supplierId;
  String supplierName;
  String supplierLastName;
  String supplierEmail;
  String supplierState;
  
  factory Listado.fromJson(String str) => Listado.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Listado.fromMap(Map<String, dynamic> json) => Listado(
        supplierId: json["providerid"],
        supplierName: json["provider_name"],
        supplierLastName: json["provider_last_name"],
        supplierEmail: json["provider_mail"],
        supplierState: json["provider_state"],
      );

  Map<String, dynamic> toMap() => {
        "providerid": supplierId,
        "provider_name": supplierName,
        "provider_last_name": supplierLastName,
        "provider_mail": supplierEmail,
        "provider_state": supplierState,
      };

  Listado copy() => Listado(
      supplierId: supplierId,
      supplierName: supplierName,
      supplierLastName: supplierLastName,
      supplierEmail: supplierEmail,
      supplierState: supplierState);
}
