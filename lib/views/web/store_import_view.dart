import 'package:flutter/material.dart';
import 'package:excel/excel.dart';
import '../../core/constants/premium_theme.dart';

class StoreImportView extends StatefulWidget {
  const StoreImportView({super.key});

  @override
  State<StoreImportView> createState() => _StoreImportViewState();
}

class _StoreImportViewState extends State<StoreImportView> {
  bool _isImporting = false;
  double _progress = 0.0;
  final int _maxLimit = 10000;

  void _downloadTemplate() {
    var excel = Excel.createExcel();
    Sheet sheetObject = excel['Lista_de_Lojas'];
    
    // Cabeçalho Padrão
    sheetObject.appendRow(['NOME_FANTASIA', 'CNPJ', 'LOGRADOURO', 'BAIRRO', 'CIDADE', 'ESTADO', 'CEP', 'LATITUDE', 'LONGITUDE']);
    
    // Exemplo
    sheetObject.appendRow(['Exemplo Loja 01', '00.000.000/0001-00', 'Rua Exemplo, 123', 'Centro', 'São Paulo', 'SP', '01001-000', '-23.5505', '-46.6333']);

    excel.save(fileName: 'modelo_importacao_checkfast.xlsx');
  }

  void _startImport() async {
    setState(() {
      _isImporting = true;
      _progress = 0.0;
    });

    // Simulando processamento de até 10.000 linhas
    for (int i = 0; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 50));
      setState(() {
        _progress = i / 100;
      });
    }

    setState(() {
      _isImporting = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Importação concluída com sucesso!'), backgroundColor: AppColors.successEmerald),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.spaceBlack,
      body: Center(
        child: Container(
          width: 600,
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(color: AppColors.cardDark, borderRadius: BorderRadius.circular(20), border: Border.all(color: AppColors.glassBorderDark)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.file_upload_outlined, color: AppColors.neonCyan, size: 60),
              const SizedBox(height: 20),
              const Text('Importador em Massa', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text('Suba até $_maxLimit lojas de uma só vez usando nosso modelo padrão.', style: const TextStyle(color: AppColors.textSecondary), textAlign: TextAlign.center),
              const SizedBox(height: 40),
              
              // Passo 1: Download do Modelo
              _buildStepCard(
                '1. Baixe o Modelo',
                'Use nossa planilha padrão para evitar erros de leitura.',
                Icons.download,
                _downloadTemplate,
              ),
              const SizedBox(height: 20),
              
              // Passo 2: Upload
              _buildStepCard(
                '2. Envie o Arquivo',
                'Selecione a planilha preenchida (máx. 10.000 lojas).',
                Icons.drive_folder_upload,
                _isImporting ? null : _startImport,
              ),
              
              if (_isImporting) ...[
                const SizedBox(height: 40),
                LinearProgressIndicator(value: _progress, backgroundColor: Colors.white10, color: AppColors.neonCyan),
                const SizedBox(height: 10),
                Text('${(_progress * 100).toInt()}% Processado', style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepCard(String title, String sub, IconData icon, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: AppColors.spaceBlack, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.glassBorderDark)),
        child: Row(
          children: [
            Icon(icon, color: AppColors.electricBlue),
            const SizedBox(width: 20),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Text(sub, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12))]),
            ),
          ],
        ),
      ),
    );
  }
}
