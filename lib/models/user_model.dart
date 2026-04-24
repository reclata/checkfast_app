class UserModel {
  final String id;
  final String role; // 'admin' ou 'worker'
  final String name;
  final String cpf;
  final String phone;
  final String email;
  final String pixKey;
  final String experience;
  final String status; // 'Em análise', 'Aprovado', 'Reprovado', 'Bloqueado', 'Ativo'
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.role,
    required this.name,
    required this.cpf,
    required this.phone,
    required this.email,
    required this.pixKey,
    required this.experience,
    required this.status,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'role': role,
      'name': name,
      'cpf': cpf,
      'phone': phone,
      'email': email,
      'pixKey': pixKey,
      'experience': experience,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      role: map['role'] ?? 'worker',
      name: map['name'] ?? '',
      cpf: map['cpf'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      pixKey: map['pixKey'] ?? '',
      experience: map['experience'] ?? '',
      status: map['status'] ?? 'Em análise',
      createdAt: DateTime.tryParse(map['createdAt'] ?? '') ?? DateTime.now(),
    );
  }
}
