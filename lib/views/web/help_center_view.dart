import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class HelpCenterView extends StatelessWidget {
  const HelpCenterView({super.key});

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
                Icon(Icons.help_center, color: AppColors.white, size: 28),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Central de Ajuda - Agência', style: AppTextStyles.title),
                  const SizedBox(height: 10),
                  Text('Aprenda a dominar as ferramentas do CheckFast.', style: AppTextStyles.subtitle),
                  const SizedBox(height: 30),
                  Expanded(
                    child: ListView(
                      children: [
                        _buildHelpItem('Como gerar o lote PIX?', 'Vá em Financeiro > Gerar Lote. O sistema criará um arquivo TXT padrão bancário com todos os aprovados.'),
                        _buildHelpItem('O que é o motor de 4 horas?', 'É a nossa trava de segurança. Se o promotor trabalhar menos de 4h entre check-in e check-out, a diária é reprovada automaticamente.'),
                        _buildHelpItem('Como cadastrar uma nova loja?', 'Acesse Lojas > Cadastrar. Lembre-se de clicar em "Buscar Coordenadas" para travar o GPS do promotor.'),
                        _buildHelpItem('O que fazer se o promotor não for?', 'Acesse o módulo de Substituição. O prazo varia de acordo com o projeto (Atacadão: 24h, Projeto One: 48h).'),
                      ],
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

  Widget _buildHelpItem(String q, String a) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        title: Text(q, style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryBlue)),
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(a, style: const TextStyle(color: AppColors.neutralGray)),
          )
        ],
      ),
    );
  }
}
