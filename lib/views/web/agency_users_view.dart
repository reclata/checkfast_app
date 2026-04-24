import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class AgencyUsersView extends StatefulWidget {
  const AgencyUsersView({super.key});

  @override
  State<AgencyUsersView> createState() => _AgencyUsersViewState();
}

class _AgencyUsersViewState extends State<AgencyUsersView> {
  // Lista simulada de usuários da Agência
  final List<Map<String, dynamic>> _internalUsers = [
    {
      'name': 'Carlos Gerente',
      'email': 'carlos@agencia.com',
      'role': 'Administrador Geral',
      'active': true,
    },
    {
      'name': 'Marina Financeiro',
      'email': 'marina@agencia.com',
      'role': 'Coordenador Financeiro',
      'active': true,
    },
  ];

  // Estado do formulário de permissões (novo usuário)
  Map<String, Map<String, bool>> _newPermissions = {
    'Dashboard': {'Ver': true, 'Criar/Editar': false, 'Excluir': false},
    'Lojas': {'Ver': true, 'Criar/Editar': true, 'Excluir': false},
    'Demandas': {'Ver': true, 'Criar/Editar': true, 'Excluir': false},
    'Colaboradores': {'Ver': true, 'Criar/Editar': false, 'Excluir': false},
    'Financeiro': {'Ver': false, 'Criar/Editar': false, 'Excluir': false},
  };

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
                Icon(Icons.manage_accounts, color: AppColors.white, size: 28), // Menu Usuários Internos
              ],
            ),
          ),

          // Área Principal
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Gestão de Usuários e Permissões (Equipe Interna)', style: AppTextStyles.title),
                  const SizedBox(height: 10),
                  Text('Crie os acessos da equipe da Agência e defina rigorosamente o que cada pessoa pode visualizar, editar ou excluir no sistema.', style: AppTextStyles.subtitle),
                  const SizedBox(height: 40),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Painel de Cadastro e Definição de Permissões
                      Expanded(
                        flex: 5,
                        child: _buildPermissionsPanel(),
                      ),
                      const SizedBox(width: 30),
                      // Tabela de Usuários Atuais
                      Expanded(
                        flex: 3,
                        child: _buildUsersListPanel(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPermissionsPanel() {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15, offset: const Offset(0, 5))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Criar Novo Perfil de Acesso', style: AppTextStyles.subtitle.copyWith(color: AppColors.darkBlue)),
          const SizedBox(height: 25),
          
          Row(
            children: [
              Expanded(child: _buildTextField('Nome Completo', Icons.person)),
              const SizedBox(width: 20),
              Expanded(child: _buildTextField('E-mail Corporativo', Icons.email)),
            ],
          ),
          const SizedBox(height: 20),
          _buildTextField('Cargo / Nome do Perfil (Ex: Coordenador de Trade)', Icons.badge),
          
          const SizedBox(height: 30),
          const Divider(),
          const SizedBox(height: 20),

          // Matriz de Permissões
          Text('Matriz de Permissões (Flags de Acesso)', style: AppTextStyles.subtitle.copyWith(color: AppColors.primaryBlue)),
          const SizedBox(height: 15),
          
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.neutralGray.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: _newPermissions.keys.map((module) {
                return _buildPermissionRow(module, _newPermissions[module]!);
              }).toList(),
            ),
          ),

          const SizedBox(height: 30),

          // Botão Salvar
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Usuário interno e matriz de permissões criados com sucesso!'), backgroundColor: AppColors.successGreen)
                );
              },
              icon: const Icon(Icons.security, color: AppColors.white),
              label: const Text('SALVAR USUÁRIO E PERMISSÕES', style: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPermissionRow(String moduleName, Map<String, bool> actions) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.neutralGray.withOpacity(0.2))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(moduleName, style: AppTextStyles.body.copyWith(fontWeight: FontWeight.bold)),
          ),
          ...actions.keys.map((action) {
            return Expanded(
              flex: 1,
              child: Row(
                children: [
                  Checkbox(
                    value: actions[action],
                    activeColor: action == 'Excluir' ? Colors.redAccent : AppColors.successGreen,
                    onChanged: (value) {
                      setState(() {
                        actions[action] = value!;
                      });
                    },
                  ),
                  Text(action, style: const TextStyle(fontSize: 12)),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildUsersListPanel() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.neutralGray.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Equipe Cadastrada', style: AppTextStyles.subtitle.copyWith(color: AppColors.darkBlue)),
          const SizedBox(height: 15),
          ..._internalUsers.map((user) {
            return ListTile(
              leading: CircleAvatar(backgroundColor: AppColors.primaryBlue.withOpacity(0.1), child: Text(user['name'].substring(0, 1), style: const TextStyle(color: AppColors.primaryBlue))),
              title: Text(user['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(user['role']),
              trailing: IconButton(icon: const Icon(Icons.edit, color: AppColors.neutralGray), onPressed: () {}),
              contentPadding: EdgeInsets.zero,
            );
          }).toList()
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
    );
  }
}
