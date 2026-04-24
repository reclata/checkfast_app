import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class FinanceWorkerView extends StatelessWidget {
  const FinanceWorkerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Ganhos', style: TextStyle(color: AppColors.white)),
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Resumo do Mês
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: AppColors.primaryBlue.withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 5))
                ],
              ),
              child: Column(
                children: [
                  Text('Disponível para Saque (PIX)', style: AppTextStyles.body.copyWith(color: AppColors.white)),
                  const SizedBox(height: 10),
                  Text('R\$ 450,00', style: AppTextStyles.title.copyWith(color: AppColors.white, fontSize: 36)),
                ],
              ),
            ),
            const SizedBox(height: 30),

            Text('Histórico de Diárias', style: AppTextStyles.title),
            const SizedBox(height: 15),

            // Lista de Diárias
            _buildFinanceCard(
              storeName: 'Supermercado Central',
              date: '23/04/2026',
              hours: '8h 30m',
              value: 'R\$ 150,00',
              status: 'Pago',
              isValid: true,
            ),
            const SizedBox(height: 15),
            _buildFinanceCard(
              storeName: 'Loja de Cosméticos',
              date: '22/04/2026',
              hours: '5h 00m',
              value: 'R\$ 100,00',
              status: 'Aprovado',
              isValid: true,
            ),
            const SizedBox(height: 15),
            _buildFinanceCard(
              storeName: 'Farmácia Vida',
              date: '20/04/2026',
              hours: '3h 15m',
              value: 'R\$ 0,00',
              status: 'Reprovado',
              isValid: false, // Menos de 4h
              alertMessage: 'Tempo inferior a 4h mínimas.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFinanceCard({
    required String storeName,
    required String date,
    required String hours,
    required String value,
    required String status,
    required bool isValid,
    String? alertMessage,
  }) {
    Color statusColor;
    switch (status) {
      case 'Pago':
        statusColor = AppColors.successGreen;
        break;
      case 'Aprovado':
        statusColor = AppColors.cyan;
        break;
      case 'Reprovado':
        statusColor = Colors.redAccent;
        break;
      default:
        statusColor = AppColors.neutralGray;
    }

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.neutralGray.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 5, offset: const Offset(0, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(storeName, style: AppTextStyles.subtitle.copyWith(color: AppColors.darkBlue)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(status, style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 12)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 14, color: AppColors.neutralGray),
                  const SizedBox(width: 5),
                  Text(date, style: AppTextStyles.body.copyWith(color: AppColors.neutralGray)),
                ],
              ),
              Row(
                children: [
                  Icon(isValid ? Icons.timer : Icons.timer_off, size: 14, color: isValid ? AppColors.neutralGray : Colors.redAccent),
                  const SizedBox(width: 5),
                  Text(hours, style: AppTextStyles.body.copyWith(color: isValid ? AppColors.neutralGray : Colors.redAccent)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (!isValid && alertMessage != null) ...[
            Text(alertMessage, style: const TextStyle(color: Colors.redAccent, fontSize: 12, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
          ],
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Valor da Diária:', style: TextStyle(fontWeight: FontWeight.w600)),
              Text(value, style: AppTextStyles.title.copyWith(color: isValid ? AppColors.primaryBlue : Colors.redAccent, fontSize: 18)),
            ],
          )
        ],
      ),
    );
  }
}
