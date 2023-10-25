import 'dart:convert';

Baket baketFromJson(String str) => Baket.fromJson(json.decode(str));

String baketToJson(Baket data) => json.encode(data.toJson());

class Baket {
  String id;
  String name;
  String quantity;

  Baket({
    required this.id,
    required this.name,
    required this.quantity,
  });

  factory Baket.fromJson(Map<String, dynamic> json) => Baket(
        id: json["id"],
        name: json["name"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "quantity": quantity,
      };
}
