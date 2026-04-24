class AttendanceModel {
  final String id;
  final String workerId;
  final String demandId;
  final String storeId;
  final DateTime date;
  final Map<String, dynamic>? checkIn; // time, lat, lng, photoUrl
  final Map<String, dynamic>? checkOut; // time, lat, lng, photoUrl
  final double totalHours;
  final String status; // Agendado, Em andamento, Finalizado, etc

  AttendanceModel({
    required this.id,
    required this.workerId,
    required this.demandId,
    required this.storeId,
    required this.date,
    this.checkIn,
    this.checkOut,
    required this.totalHours,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'workerId': workerId,
      'demandId': demandId,
      'storeId': storeId,
      'date': date.toIso8601String(),
      'checkIn': checkIn,
      'checkOut': checkOut,
      'totalHours': totalHours,
      'status': status,
    };
  }

  factory AttendanceModel.fromMap(Map<String, dynamic> map) {
    return AttendanceModel(
      id: map['id'] ?? '',
      workerId: map['workerId'] ?? '',
      demandId: map['demandId'] ?? '',
      storeId: map['storeId'] ?? '',
      date: DateTime.tryParse(map['date'] ?? '') ?? DateTime.now(),
      checkIn: map['checkIn'] != null ? Map<String, dynamic>.from(map['checkIn']) : null,
      checkOut: map['checkOut'] != null ? Map<String, dynamic>.from(map['checkOut']) : null,
      totalHours: (map['totalHours'] ?? 0).toDouble(),
      status: map['status'] ?? 'Agendado',
    );
  }
}
