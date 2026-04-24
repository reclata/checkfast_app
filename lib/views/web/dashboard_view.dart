import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Menu Lateral Fixo (Sidebar)
          Container(
            width: 250,
            color: AppColors.darkBlue,
            child: Column(
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.check_circle_outline, color: AppColors.cyan, size: 32),
                    const SizedBox(width: 10),
                    Text(
                      'CheckFast',
                      style: AppTextStyles.title.copyWith(color: AppColors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                _buildMenuItem(Icons.dashboard, 'Dashboard', isActive: true),
                _buildMenuItem(Icons.people, 'Colaboradores'),
                _buildMenuItem(Icons.store, 'Lojas'),
                _buildMenuItem(Icons.assignment, 'Demandas'),
                _buildMenuItem(Icons.school, 'Treinamento'),
                _buildMenuItem(Icons.how_to_reg, 'Presença'),
                _buildMenuItem(Icons.attach_money, 'Financeiro'),
                _buildMenuItem(Icons.bar_chart, 'Relatórios'),
                const Spacer(),
                _buildMenuItem(Icons.settings, 'Configurações'),
                const SizedBox(height: 20),
              ],
            ),
          ),
          
          // Área Principal do Dashboard
          Expanded(
            child: Container(
              color: AppColors.background,
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Visão Geral', style: AppTextStyles.title),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      _buildSummaryCard('Colaboradores Ativos', '142', Icons.people, AppColors.primaryBlue),
                      const SizedBox(width: 20),
                      _buildSummaryCard('Lojas com Vagas', '18', Icons.store, AppColors.cyan),
                      const SizedBox(width: 20),
                      _buildSummaryCard('Presenças Hoje', '89', Icons.how_to_reg, AppColors.successGreen),
                      const SizedBox(width: 20),
                      _buildSummaryCard('Pagamentos Pendentes', 'R\$ 3.450', Icons.attach_money, AppColors.neutralGray),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Últimos Check-ins', style: AppTextStyles.subtitle),
                          const Divider(),
                          // Placeholder para uma tabela de presenças
                          const Expanded(
                            child: Center(
                              child: Text('Tabela de controle de presença em tempo real será renderizada aqui.'),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {bool isActive = false}) {
    return Container(
      color: isActive ? AppColors.primaryBlue.withOpacity(0.2) : Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        children: [
          Icon(icon, color: isActive ? AppColors.cyan : AppColors.neutralGray, size: 24),
          const SizedBox(width: 15),
          Text(
            title,
            style: AppTextStyles.body.copyWith(
              color: isActive ? AppColors.white : AppColors.neutralGray,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(String title, String value, IconData icon, Color iconColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: iconColor, size: 30),
              ],
            ),
            const SizedBox(height: 15),
            Text(value, style: AppTextStyles.title.copyWith(fontSize: 28)),
            const SizedBox(height: 5),
            Text(title, style: AppTextStyles.body.copyWith(color: AppColors.neutralGray)),
          ],
        ),
      ),
    );
  }
}
