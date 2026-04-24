import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class BusinessIntelligenceView extends StatelessWidget {
  const BusinessIntelligenceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          Container(
            width: 80,
            color: AppColors.darkBlue,
            child: const Column(
              children: [
                SizedBox(height: 30),
                Icon(Icons.check_circle_outline, color: AppColors.cyan, size: 32),
                SizedBox(height: 40),
                Icon(Icons.insights, color: AppColors.white, size: 28),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Business Intelligence (BI) - Dashboard Executivo', style: AppTextStyles.title),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      _buildMiniCard('Crescimento Mensal', '+24%', Icons.trending_up, Colors.green),
                      const SizedBox(width: 20),
                      _buildMiniCard('Eficiência de Escala', '98.2%', Icons.done_all, AppColors.cyan),
                      const SizedBox(width: 20),
                      _buildMiniCard('Churn de Promotores', '1.5%', Icons.person_remove, Colors.red),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Volume de Diárias Processadas (Semanal)', style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 40),
                          Expanded(
                            child: BarChart(
                              BarChartData(
                                barGroups: [
                                  BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 10, color: AppColors.primaryBlue)]),
                                  BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 15, color: AppColors.primaryBlue)]),
                                  BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 8, color: AppColors.cyan)]),
                                  BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 12, color: AppColors.primaryBlue)]),
                                  BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 20, color: AppColors.successGreen)]),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiniCard(String title, String value, IconData icon, Color color) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: color.withOpacity(0.2))),
      child: Column(
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(height: 10),
          Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color)),
          Text(title, style: const TextStyle(fontSize: 10, color: AppColors.neutralGray)),
        ],
      ),
    );
  }
}
