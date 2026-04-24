import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class RoutingService {
  static Future<void> openInMaps(double lat, double lng) async {
    final googleMapsUrl = Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lng');
    final wazeUrl = Uri.parse('https://waze.com/ul?ll=$lat,$lng&navigate=yes');

    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl);
    } else if (await canLaunchUrl(wazeUrl)) {
      await launchUrl(wazeUrl);
    } else {
      throw 'Não foi possível abrir o mapa.';
    }
  }
}

class WorkerRankingWidget extends StatelessWidget {
  final double rating;
  final int points;

  const WorkerRankingWidget({super.key, required this.rating, required this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Text('SEU RANKING', style: TextStyle(color: Colors.white70, fontSize: 10)),
              Row(
                children: [
                  const Icon(Icons.star, color: AppColors.cyan, size: 20),
                  const SizedBox(width: 5),
                  Text(rating.toStringAsFixed(1), style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          Container(width: 1, height: 40, color: Colors.white24),
          Column(
            children: [
              const Text('FIDELIDADE', style: TextStyle(color: Colors.white70, fontSize: 10)),
              Text('$points pts', style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
