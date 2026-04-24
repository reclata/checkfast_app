import 'package:flutter/material.dart';
import '../../core/constants/premium_theme.dart';

class WorkerDetailsView extends StatelessWidget {
  const WorkerDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.spaceBlack,
        appBar: AppBar(
          backgroundColor: AppColors.cardDark,
          title: const Text('Perfil do Colaborador', style: TextStyle(color: Colors.white)),
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: AppColors.neonCyan,
            labelColor: AppColors.neonCyan,
            unselectedLabelColor: AppColors.textSecondary,
            tabs: [
              Tab(text: 'DADOS BÁSICOS'),
              Tab(text: 'DOCUMENTOS'),
              Tab(text: 'HISTÓRICO'),
              Tab(text: 'FINANCEIRO'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildGeneralTab(),
            _buildDocumentsTab(),
            _buildHistoryTab(),
            _buildFinancialTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildGeneralTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          const CircleAvatar(radius: 50, backgroundColor: AppColors.glassBorderDark, child: Icon(Icons.person, size: 50, color: Colors.white30)),
          const SizedBox(height: 20),
          _buildInfoField('Nome', 'João da Silva Silva'),
          _buildInfoField('CPF', '123.456.789-00'),
          _buildInfoField('Telefone', '(11) 98765-4321'),
          _buildInfoField('Chave PIX', 'joao@email.com'),
        ],
      ),
    );
  }

  Widget _buildDocumentsTab() {
    return ListView(
      padding: const EdgeInsets.all(25),
      children: [
        _buildDocItem('RG (Frente)', 'rg_frente.jpg'),
        _buildDocItem('RG (Verso)', 'rg_verso.jpg'),
        _buildDocItem('CPF', 'cpf_digital.pdf'),
        _buildDocItem('Comprovante de Residência', 'conta_luz.png'),
        const SizedBox(height: 20),
        ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.upload_file), label: const Text('ANEXAR NOVO DOCUMENTO')),
      ],
    );
  }

  Widget _buildDocItem(String label, String fileName) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: AppColors.cardDark, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.glassBorderDark)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Text(fileName, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12))]),
          const Icon(Icons.remove_red_eye, color: AppColors.neonCyan),
        ],
      ),
    );
  }

  Widget _buildHistoryTab() {
    return ListView(
      padding: const EdgeInsets.all(25),
      children: [
        ListTile(title: const Text('Atacadão Premium', style: TextStyle(color: Colors.white)), subtitle: const Text('15/04/2026 - Concluído'), trailing: const Icon(Icons.check_circle, color: AppColors.successEmerald)),
        ListTile(title: const Text('Projeto One', style: TextStyle(color: Colors.white)), subtitle: const Text('12/04/2026 - Concluído'), trailing: const Icon(Icons.check_circle, color: AppColors.successEmerald)),
      ],
    );
  }

  Widget _buildFinancialTab() {
    return ListView(
      padding: const EdgeInsets.all(25),
      children: [
        ListTile(title: const Text('R$ 150,00', style: TextStyle(color: AppColors.successEmerald, fontWeight: FontWeight.bold)), subtitle: const Text('Pagamento via PIX - 16/04'), trailing: const Text('PAGO', style: TextStyle(color: Colors.white38))),
        ListTile(title: const Text('R$ 150,00', style: TextStyle(color: AppColors.successEmerald, fontWeight: FontWeight.bold)), subtitle: const Text('Pagamento via PIX - 13/04'), trailing: const Text('PAGO', style: TextStyle(color: Colors.white38))),
      ],
    );
  }

  Widget _buildInfoField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        initialValue: value,
        readOnly: true,
        decoration: InputDecoration(labelText: label, labelStyle: const TextStyle(color: AppColors.textSecondary), border: const OutlineInputBorder()),
      ),
    );
  }
}
