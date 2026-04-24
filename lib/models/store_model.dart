class StoreModel {
  final String id;
  final String name;
  final String cnpj;
  final Map<String, dynamic> address; // lat, lng, street, city
  final String responsible;
  final String rules;
  final bool active;

  StoreModel({
    required this.id,
    required this.name,
    required this.cnpj,
    required this.address,
    required this.responsible,
    required this.rules,
    required this.active,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'cnpj': cnpj,
      'address': address,
      'responsible': responsible,
      'rules': rules,
      'active': active,
    };
  }

  factory StoreModel.fromMap(Map<String, dynamic> map) {
    return StoreModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      cnpj: map['cnpj'] ?? '',
      address: Map<String, dynamic>.from(map['address'] ?? {}),
      responsible: map['responsible'] ?? '',
      rules: map['rules'] ?? '',
      active: map['active'] ?? true,
    );
  }
}
