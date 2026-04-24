import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationService {
  static final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    await _plugin.initialize(const InitializationSettings(android: androidSettings));
  }

  static Future<void> notifyNewVacancies(int count, String project) async {
    const details = AndroidNotificationDetails(
      'new_vaga_channel',
      'Novas Vagas',
      importance: Importance.max,
      priority: Priority.high,
    );
    await _plugin.show(
      1,
      '🎯 Oportunidade Perto de Você!',
      'Foram publicadas $count novas vagas para o projeto $project. Aceite agora!',
      const NotificationDetails(android: details),
    );
  }
}
