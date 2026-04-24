import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class SubstitutionManagementView extends StatefulWidget {
  const SubstitutionManagementView({super.key});

  @override
  State<SubstitutionManagementView> createState() => _SubstitutionManagementViewState();
}

class _SubstitutionManagementViewState extends State<SubstitutionManagementView> {
  final List<Map<String, dynamic>> _pendingSubstitutions = [
    {
      'project': 'Atacadão',
      'store': 'Atacadão Premium',
      'originalWorker': 'João Silva',
      'deadlineHours': 24,
      'status': 'Faltou / Substituição Pendente',
      'priority': 'Alta',
    },
    {
      'project': 'Projeto One',
      'store': 'Farmácia Vida',
      'originalWorker': 'Maria Oliveira',
      'deadlineHours': 48,
      'status': 'Cancelou / Aguardando',
      'priority': 'Média',
    },
  ];

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
                Icon(Icons.swap_horiz, color: AppColors.white, size: 28),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Gestão de Substituições e Prazos', style: AppTextStyles.title),
                  const SizedBox(height: 10),
                  Text('Gerencie colaboradores faltantes e configure prazos de substituição por projeto.', style: AppTextStyles.subtitle),
                  const SizedBox(height: 30),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _pendingSubstitutions.length,
                      itemBuilder: (context, index) {
                        final item = _pendingSubstitutions[index];
                        return _buildSubstitutionCard(item);
                      },
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

  Widget _buildSubstitutionCard(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Projeto: ${item['project']}', style: AppTextStyles.subtitle.copyWith(color: AppColors.primaryBlue)),
                  Text('Loja: ${item['store']}', style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: item['priority'] == 'Alta' ? Colors.red.withOpacity(0.1) : Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text('Prazo: ${item['deadlineHours']}h', style: TextStyle(color: item['priority'] == 'Alta' ? Colors.red : Colors.orange, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const Divider(height: 30),
          Row(
            children: [
              const Icon(Icons.person_off, color: AppColors.neutralGray),
              const SizedBox(width: 10),
              Text('Original: ${item['originalWorker']}', style: AppTextStyles.body),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.successGreen),
                child: const Text('ESCALAR SUBSTITUTO', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
