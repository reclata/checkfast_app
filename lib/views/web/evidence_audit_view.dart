import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class EvidenceAuditView extends StatelessWidget {
  const EvidenceAuditView({super.key});

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
                Icon(Icons.photo_library, color: AppColors.white, size: 28),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Mural de Evidências e Auditoria', style: AppTextStyles.title),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.picture_as_pdf, color: Colors.white),
                        label: const Text('EXPORTAR RELATÓRIO PDF', style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryBlue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 1.5,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) => _buildEvidenceCard(),
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

  Widget _buildEvidenceCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Promotor: João Silva', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Loja: Atacadão Premium', style: TextStyle(fontSize: 12, color: AppColors.neutralGray)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: AppColors.successGreen.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                child: const Text('GPS OK', style: TextStyle(color: AppColors.successGreen, fontSize: 10, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: Row(
              children: [
                Expanded(child: _buildImagePlaceholder('CHECK-IN')),
                const SizedBox(width: 10),
                Expanded(child: _buildImagePlaceholder('CHECK-OUT')),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tempo: 08h 15m', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              Icon(Icons.verified, color: AppColors.cyan, size: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImagePlaceholder(String label) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.neutralGray.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(label, style: const TextStyle(fontSize: 10, color: AppColors.neutralGray)),
      ),
    );
  }
}
