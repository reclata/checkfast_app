import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class CheckinView extends StatefulWidget {
  const CheckinView({super.key});

  @override
  State<CheckinView> createState() => _CheckinViewState();
}

class _CheckinViewState extends State<CheckinView> {
  bool _isLoadingLocation = false;
  bool _hasPhoto = false;

  void _simulateLocationFetch() {
    setState(() => _isLoadingLocation = true);
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => _isLoadingLocation = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmar Check-in', style: TextStyle(color: AppColors.white)),
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Loja Alvo
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primaryBlue.withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Demanda Atual', style: AppTextStyles.subtitle.copyWith(color: AppColors.primaryBlue)),
                  const SizedBox(height: 10),
                  Text('Loja: Supermercado Central', style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold)),
                  Text('Função: Promotor de Vendas', style: AppTextStyles.body),
                  Text('Horário: 08:00 - 18:00', style: AppTextStyles.body),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Validação de Localização
            Text('1. Validação de Localização', style: AppTextStyles.subtitle),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _simulateLocationFetch,
              icon: const Icon(Icons.location_on, color: AppColors.white),
              label: const Text('Obter Localização Atual', style: TextStyle(color: AppColors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkBlue,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 10),
            if (_isLoadingLocation)
              const Center(child: CircularProgressIndicator(color: AppColors.primaryBlue))
            else
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.successGreen.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, color: AppColors.successGreen),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Localização validada com sucesso! Você está a 15m da loja.',
                        style: AppTextStyles.body.copyWith(color: AppColors.successGreen),
                      ),
                    ),
                  ],
                ),
              ),
            
            const SizedBox(height: 30),

            // Validação de Foto
            Text('2. Foto no Local', style: AppTextStyles.subtitle),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() => _hasPhoto = true); // Simula tirar foto
              },
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.neutralGray, style: BorderStyle.solid),
                ),
                child: _hasPhoto 
                  ? const Center(child: Icon(Icons.check_circle, color: AppColors.successGreen, size: 50))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.camera_alt, color: AppColors.neutralGray, size: 40),
                        const SizedBox(height: 10),
                        Text('Tirar Foto da Fachada/Gôndola', style: AppTextStyles.body.copyWith(color: AppColors.neutralGray)),
                      ],
                    ),
              ),
            ),

            const SizedBox(height: 40),

            // Botão Confirmar
            ElevatedButton(
              onPressed: () {
                // Ação de confirmar
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Text('CONFIRMAR CHECK-IN', style: AppTextStyles.button),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3, // Check-in selecionado
        selectedItemColor: AppColors.primaryBlue,
        unselectedItemColor: AppColors.neutralGray,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Lojas'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Tarefas'),
          BottomNavigationBarItem(icon: Icon(Icons.how_to_reg), label: 'Check-in'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
