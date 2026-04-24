import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class TrainingApprovalView extends StatelessWidget {
  const TrainingApprovalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          // Placeholder do Sidebar para manter contexto (Poderia ser um widget compartilhado)
          Container(
            width: 80,
            color: AppColors.darkBlue,
            child: const Column(
              children: [
                SizedBox(height: 30),
                Icon(Icons.check_circle_outline, color: AppColors.cyan, size: 32),
                SizedBox(height: 40),
                Icon(Icons.school, color: AppColors.white, size: 28), // Menu Ativo
              ],
            ),
          ),

          // Conteúdo Principal
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Aprovação de Treinamento (1º Dia)', style: AppTextStyles.title),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.pending_actions, color: Colors.orange, size: 18),
                            SizedBox(width: 8),
                            Text('3 Pendentes de Análise', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text('Avalie os check-ins e check-outs dos colaboradores em fase de teste.', style: AppTextStyles.subtitle),
                  const SizedBox(height: 30),

                  // Lista de Aprovações
                  Expanded(
                    child: ListView(
                      children: [
                        _buildApprovalCard(
                          name: 'João Silva',
                          store: 'Supermercado Central',
                          date: '23/04/2026',
                          hours: '8h 10m',
                          checkInLocStatus: true,
                          checkOutLocStatus: true,
                          photoInUrl: 'https://via.placeholder.com/150',
                          photoOutUrl: 'https://via.placeholder.com/150',
                        ),
                        const SizedBox(height: 20),
                        _buildApprovalCard(
                          name: 'Maria Oliveira',
                          store: 'Farmácia Vida',
                          date: '23/04/2026',
                          hours: '3h 45m',
                          checkInLocStatus: true,
                          checkOutLocStatus: false, // Fora do raio
                          photoInUrl: 'https://via.placeholder.com/150',
                          photoOutUrl: 'https://via.placeholder.com/150',
                          hasAlert: true,
                          alertMsg: 'Checkout fora do raio permitido (300m da loja) e duração < 4h.',
                        ),
                      ],
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

  Widget _buildApprovalCard({
    required String name,
    required String store,
    required String date,
    required String hours,
    required bool checkInLocStatus,
    required bool checkOutLocStatus,
    required String photoInUrl,
    required String photoOutUrl,
    bool hasAlert = false,
    String? alertMsg,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabeçalho do Card
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(backgroundColor: AppColors.primaryBlue.withOpacity(0.1), child: const Icon(Icons.person, color: AppColors.primaryBlue)),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: AppTextStyles.title.copyWith(fontSize: 18)),
                      Text('$store | $date', style: AppTextStyles.body.copyWith(color: AppColors.neutralGray)),
                    ],
                  ),
                ],
              ),
              Text('Tempo Total: $hours', style: AppTextStyles.title.copyWith(fontSize: 18, color: AppColors.darkBlue)),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 10),

          if (hasAlert) ...[
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.redAccent.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
              child: Row(
                children: [
                  const Icon(Icons.warning_amber_rounded, color: Colors.redAccent),
                  const SizedBox(width: 10),
                  Expanded(child: Text(alertMsg ?? '', style: const TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold))),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],

          // Fotos e Localização
          Row(
            children: [
              Expanded(
                child: _buildPhotoBlock('Check-in', photoInUrl, '08:00', checkInLocStatus),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: _buildPhotoBlock('Check-out', photoOutUrl, '16:10', checkOutLocStatus),
              ),
            ],
          ),

          const SizedBox(height: 20),
          
          // Botões de Ação
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.close, color: Colors.redAccent),
                label: const Text('REPROVAR E BLOQUEAR', style: TextStyle(color: Colors.redAccent)),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.redAccent),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
              const SizedBox(width: 15),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.check, color: AppColors.white),
                label: const Text('APROVAR TREINAMENTO', style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.successGreen,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoBlock(String type, String imgUrl, String time, bool locValid) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(type, style: AppTextStyles.subtitle.copyWith(color: AppColors.darkBlue)),
        const SizedBox(height: 10),
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: AppColors.neutralGray.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            image: const DecorationImage(image: NetworkImage('https://static.vecteezy.com/system/resources/previews/000/153/588/original/vector-roadmap-location-map.jpg'), fit: BoxFit.cover), // Placeholder de foto
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Horário: $time', style: AppTextStyles.body),
            Row(
              children: [
                Icon(locValid ? Icons.check_circle : Icons.error, size: 16, color: locValid ? AppColors.successGreen : Colors.redAccent),
                const SizedBox(width: 4),
                Text('GPS', style: TextStyle(color: locValid ? AppColors.successGreen : Colors.redAccent, fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        )
      ],
    );
  }
}
