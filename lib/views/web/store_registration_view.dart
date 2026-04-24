import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class StoreRegistrationView extends StatefulWidget {
  const StoreRegistrationView({super.key});

  @override
  State<StoreRegistrationView> createState() => _StoreRegistrationViewState();
}

class _StoreRegistrationViewState extends State<StoreRegistrationView> {
  final _formKey = GlobalKey<FormState>();
  
  bool _isLoadingGeo = false;
  String _simulatedLat = '';
  String _simulatedLng = '';

  void _getGeoFromAddress() {
    // Na prática, chamaria uma API do Google Maps (Geocoding API)
    setState(() => _isLoadingGeo = true);
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoadingGeo = false;
        _simulatedLat = '-23.550520';
        _simulatedLng = '-46.633308';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Coordenadas capturadas com sucesso!'), backgroundColor: AppColors.successGreen)
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          // Sidebar Placeholder
          Container(
            width: 80,
            color: AppColors.darkBlue,
            child: const Column(
              children: [
                SizedBox(height: 30),
                Icon(Icons.check_circle_outline, color: AppColors.cyan, size: 32),
                SizedBox(height: 40),
                Icon(Icons.storefront, color: AppColors.white, size: 28), // Menu Lojas Ativo
              ],
            ),
          ),

          // Conteúdo
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Cadastro de Nova Loja / PDV', style: AppTextStyles.title),
                  const SizedBox(height: 10),
                  Text('Cadastre a loja com precisão de GPS para permitir o check-in geolocalizado.', style: AppTextStyles.subtitle),
                  const SizedBox(height: 40),

                  Container(
                    width: 700,
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15, offset: const Offset(0, 5))
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Dados Básicos
                          Text('Dados da Loja', style: AppTextStyles.subtitle.copyWith(color: AppColors.darkBlue)),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: _buildTextField('Nome da Loja (Fantasia)', Icons.store),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                flex: 1,
                                child: _buildTextField('CNPJ', Icons.domain),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          _buildTextField('Responsável / Gerente (Contato)', Icons.person),
                          
                          const SizedBox(height: 30),
                          const Divider(),
                          const SizedBox(height: 20),

                          // Endereço e Geolocalização
                          Text('Endereço e Mapeamento', style: AppTextStyles.subtitle.copyWith(color: AppColors.darkBlue)),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(flex: 3, child: _buildTextField('Logradouro (Rua, Av, Número)', Icons.map)),
                              const SizedBox(width: 20),
                              Expanded(flex: 1, child: _buildTextField('CEP', Icons.local_post_office)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(child: _buildTextField('Bairro', Icons.location_city)),
                              const SizedBox(width: 20),
                              Expanded(child: _buildTextField('Cidade', Icons.location_city)),
                              const SizedBox(width: 20),
                              Expanded(child: _buildTextField('Estado', Icons.map)),
                            ],
                          ),
                          
                          const SizedBox(height: 30),
                          
                          // Bloco de Captura de GPS
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.cyan.withOpacity(0.3)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.gps_fixed, color: AppColors.primaryBlue),
                                    const SizedBox(width: 10),
                                    Text('Coordenadas Exatas (Latitude / Longitude)', style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          hintText: _simulatedLat.isEmpty ? 'Latitude' : _simulatedLat,
                                          filled: true,
                                          fillColor: AppColors.white,
                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Expanded(
                                      child: TextFormField(
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          hintText: _simulatedLng.isEmpty ? 'Longitude' : _simulatedLng,
                                          filled: true,
                                          fillColor: AppColors.white,
                                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    ElevatedButton.icon(
                                      onPressed: _isLoadingGeo ? null : _getGeoFromAddress,
                                      icon: _isLoadingGeo 
                                        ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.white))
                                        : const Icon(Icons.search, color: AppColors.white),
                                      label: const Text('BUSCAR PELO ENDEREÇO', style: TextStyle(color: AppColors.white)),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.darkBlue,
                                        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                const Text('O sistema calculará automaticamente o raio de 200m em volta desta coordenada para permitir o Check-in dos promotores.', style: TextStyle(fontSize: 12, color: AppColors.neutralGray)),
                              ],
                            ),
                          ),

                          const SizedBox(height: 40),

                          // Botão de Salvar
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate() && _simulatedLat.isNotEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Loja e coordenadas cadastradas com sucesso no Firebase!'), backgroundColor: AppColors.successGreen)
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Por favor, preencha todos os dados e busque as coordenadas do endereço.'), backgroundColor: Colors.redAccent)
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryBlue,
                                padding: const EdgeInsets.symmetric(vertical: 20),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Text('SALVAR LOJA NO BANCO', style: AppTextStyles.button),
                            ),
                          ),
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

  Widget _buildTextField(String label, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppColors.primaryBlue),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
    );
  }
}
