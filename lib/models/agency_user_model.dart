class AgencyUserModel {
  final String id;
  final String name;
  final String email;
  final String roleName; // Ex: 'Gerente Financeiro', 'Coordenador de Trade'
  final Map<String, dynamic> permissions; // Flegar o que ele pode ver, editar ou excluir

  AgencyUserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.roleName,
    required this.permissions,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'roleName': roleName,
      'permissions': permissions,
    };
  }

  factory AgencyUserModel.fromMap(Map<String, dynamic> map) {
    return AgencyUserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      roleName: map['roleName'] ?? 'Operador',
      permissions: Map<String, dynamic>.from(map['permissions'] ?? {}),
    );
  }

  /// Método utilitário para checar uma permissão específica rapidamente
  bool can(String module, String action) {
    if (permissions.containsKey(module) && permissions[module] is Map) {
      return permissions[module][action] ?? false;
    }
    return false;
  }
}
