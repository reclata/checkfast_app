class DemandModel {
  final String id;
  final String storeId;
  final String role;
  final DateTime date;
  final double value;
  final int slots;
  final int filledSlots;
  final int substitutionDeadlineHours; // Prazo para substituição em horas (ex: 24h, 48h)
  final bool active;

  DemandModel({
    required this.id,
    required this.storeId,
    required this.role,
    required this.date,
    required this.value,
    required this.slots,
    required this.filledSlots,
    required this.substitutionDeadlineHours,
    required this.active,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'storeId': storeId,
      'role': role,
      'date': date.toIso8601String(),
      'value': value,
      'slots': slots,
      'filledSlots': filledSlots,
      'substitutionDeadlineHours': substitutionDeadlineHours,
      'active': active,
    };
  }

  factory DemandModel.fromMap(Map<String, dynamic> map) {
    return DemandModel(
      id: map['id'] ?? '',
      storeId: map['storeId'] ?? '',
      role: map['role'] ?? '',
      date: DateTime.tryParse(map['date'] ?? '') ?? DateTime.now(),
      value: (map['value'] ?? 0).toDouble(),
      slots: map['slots'] ?? 0,
      filledSlots: map['filledSlots'] ?? 0,
      substitutionDeadlineHours: map['substitutionDeadlineHours'] ?? 24,
      active: map['active'] ?? true,
    );
  }
}
