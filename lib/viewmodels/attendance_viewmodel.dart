import 'package:flutter/foundation.dart';
import '../../models/attendance_model.dart';

class AttendanceViewModel extends ChangeNotifier {
  
  /// Motor que calcula a regra das 4 horas mínimas
  AttendanceModel processCheckoutRule(AttendanceModel attendance, DateTime checkoutTime) {
    // Validação se houve checkin
    if (attendance.checkIn == null) {
      return attendance; // Não pode fazer checkout sem checkin
    }

    DateTime checkInTime = DateTime.parse(attendance.checkIn!['time']);
    
    // Calcula a diferença em horas
    Duration workDuration = checkoutTime.difference(checkInTime);
    double totalHoursWorked = workDuration.inMinutes / 60.0;

    String newStatus = 'Aguardando aprovação';

    // REGRA DE NEGÓCIO: Mínimo de 4 horas
    if (totalHoursWorked < 4.0) {
      newStatus = 'Reprovado'; // Trava automática por horas insuficientes
    }

    // Atualiza o modelo
    final updatedAttendance = AttendanceModel(
      id: attendance.id,
      workerId: attendance.workerId,
      demandId: attendance.demandId,
      storeId: attendance.storeId,
      date: attendance.date,
      checkIn: attendance.checkIn,
      checkOut: {
        'time': checkoutTime.toIso8601String(),
        'lat': 0.0, // Preenchido pelo serviço de localização
        'lng': 0.0,
        'photoUrl': 'url_da_foto',
      },
      totalHours: double.parse(totalHoursWorked.toStringAsFixed(2)),
      status: newStatus,
    );

    notifyListeners();
    return updatedAttendance;
  }
}
