import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class MapVacanciesView extends StatefulWidget {
  const MapVacanciesView({super.key});

  @override
  State<MapVacanciesView> createState() => _MapVacanciesViewState();
}

class _MapVacanciesViewState extends State<MapVacanciesView> {
  // Simulação de vagas próximas
  final List<Map<String, dynamic>> _vacancies = [
    {
      'store': 'Supermercado Central',
      'role': 'Promotor de Vendas',
      'distance': '1.2 km',
      'value': 'R\$ 150,00/dia',
      'time': '08:00 - 18:00',
      'slots': 2,
    },
    {
      'store': 'Atacadão Premium',
      'role': 'Repositor',
      'distance': '3.5 km',
      'value': 'R\$ 130,00/dia',
      'time': '09:00 - 17:00',
      'slots': 1,
    },
    {
      'store': 'Farmácia Vida',
      'role': 'Ação de Sampling',
      'distance': '5.0 km',
      'value': 'R\$ 100,00/dia',
      'time': '10:00 - 16:00',
      'slots': 5,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vagas Próximas', style: TextStyle(color: AppColors.white)),
        backgroundColor: AppColors.primaryBlue,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: AppColors.white),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          // Mapa Simulado (Placeholder)
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.neutralGray,
              image: DecorationImage(
                image: NetworkImage('https://static.vecteezy.com/system/resources/previews/000/153/588/original/vector-roadmap-location-map.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
              ),
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.my_location, color: AppColors.white, size: 16),
                    SizedBox(width: 8),
                    Text('Buscando num raio de 10km', style: TextStyle(color: AppColors.white)),
                  ],
                ),
              ),
            ),
          ),
          
          // Lista de Vagas
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: _vacancies.length,
              itemBuilder: (context, index) {
                final vacancy = _vacancies[index];
                return _buildVacancyCard(vacancy);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVacancyCard(Map<String, dynamic> vacancy) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.neutralGray.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(vacancy['store'], style: AppTextStyles.title.copyWith(fontSize: 18))),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.cyan.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: AppColors.cyan),
                    const SizedBox(width: 4),
                    Text(vacancy['distance'], style: const TextStyle(color: AppColors.cyan, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(vacancy['role'], style: AppTextStyles.subtitle.copyWith(fontSize: 14, color: AppColors.primaryBlue)),
          const SizedBox(height: 15),
          Row(
            children: [
              const Icon(Icons.access_time, size: 16, color: AppColors.neutralGray),
              const SizedBox(width: 5),
              Text(vacancy['time'], style: AppTextStyles.body.copyWith(color: AppColors.neutralGray)),
              const Spacer(),
              const Icon(Icons.people_outline, size: 16, color: AppColors.neutralGray),
              const SizedBox(width: 5),
              Text('${vacancy['slots']} vagas', style: AppTextStyles.body.copyWith(color: AppColors.neutralGray)),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(vacancy['value'], style: AppTextStyles.title.copyWith(color: AppColors.successGreen, fontSize: 18)),
              ElevatedButton(
                onPressed: () {
                  // Lógica de aceite
                  _showAcceptDialog(vacancy['store']);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('ACEITAR TAREFA', style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showAcceptDialog(String store) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar Demanda'),
        content: Text('Deseja confirmar sua ida à loja $store? Lembre-se que o cancelamento de última hora pode afetar seu perfil.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar', style: TextStyle(color: AppColors.neutralGray)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tarefa Aceita! Verifique a aba "Tarefas".'), backgroundColor: AppColors.successGreen),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryBlue),
            child: const Text('Confirmar', style: TextStyle(color: AppColors.white)),
          ),
        ],
      ),
    );
  }
}
