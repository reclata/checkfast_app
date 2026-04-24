import 'package:geolocator/geolocator.dart';

class LocationService {
  /// Verifica as permissões e obtém a localização atual
  static Future<Position?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null; // Serviço desativado
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null; // Permissão negada
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return null; // Permissão negada permanentemente
    }

    return await Geolocator.getCurrentPosition();
  }

  /// Calcula a distância em metros entre duas coordenadas
  static double calculateDistanceInMeters(
    double startLat,
    double startLng,
    double endLat,
    double endLng,
  ) {
    return Geolocator.distanceBetween(startLat, startLng, endLat, endLng);
  }

  /// Valida se o colaborador está dentro de um raio permitido (ex: 200 metros)
  static bool isWithinAllowedRadius(
    double currentLat,
    double currentLng,
    double targetLat,
    double targetLng, {
    double allowedRadius = 200.0,
  }) {
    double distance = calculateDistanceInMeters(currentLat, currentLng, targetLat, targetLng);
    return distance <= allowedRadius;
  }
}
