import 'package:flutter/material.dart';
import '../../core/constants/premium_theme.dart';

class SupportDashboardView extends StatefulWidget {
  const SupportDashboardView({super.key});

  @override
  State<SupportDashboardView> createState() => _SupportDashboardViewState();
}

class _SupportDashboardViewState extends State<SupportDashboardView> {
  final List<Map<String, dynamic>> _activeChats = [
    {
      'worker': 'João Silva',
      'lastMessage': 'Não consigo fazer o check-in facial.',
      'time': '2m ago',
      'unread': true,
      'project': 'Atacadão',
    },
    {
      'worker': 'Maria Oliveira',
      'lastMessage': 'A loja está fechada hoje.',
      'time': '15m ago',
      'unread': false,
      'project': 'Projeto One',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.spaceBlack,
      body: Row(
        children: [
          // Sidebar Placeholder
          Container(width: 80, color: AppColors.cardDark, child: const Column(children: [SizedBox(height: 30), Icon(Icons.chat_bubble_outline, color: AppColors.neonCyan)])),
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Central de Atendimento ao Promotor', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const Text('Responda as dúvidas de campo em tempo real.', style: TextStyle(color: AppColors.textSecondary)),
                  const SizedBox(height: 40),
                  
                  Expanded(
                    child: Row(
                      children: [
                        // Lista de Chats
                        Expanded(
                          flex: 1,
                          child: ListView.builder(
                            itemCount: _activeChats.length,
                            itemBuilder: (context, index) {
                              final chat = _activeChats[index];
                              return _buildChatListItem(chat);
                            },
                          ),
                        ),
                        const SizedBox(width: 30),
                        // Janela de Conversa Ativa
                        Expanded(
                          flex: 2,
                          child: _buildActiveChatWindow(),
                        ),
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

  Widget _buildChatListItem(Map<String, dynamic> chat) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: chat['unread'] ? AppColors.electricBlue.withOpacity(0.1) : AppColors.cardDark,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: chat['unread'] ? AppColors.electricBlue : AppColors.glassBorderDark),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(chat['worker'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text(chat['time'], style: const TextStyle(color: AppColors.textSecondary, fontSize: 10)),
            ],
          ),
          const SizedBox(height: 5),
          Text(chat['lastMessage'], style: TextStyle(color: chat['unread'] ? Colors.white : AppColors.textSecondary, fontSize: 12), overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }

  Widget _buildActiveChatWindow() {
    return Container(
      decoration: BoxDecoration(color: AppColors.cardDark, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppColors.glassBorderDark)),
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          const Row(
            children: [
              CircleAvatar(backgroundColor: AppColors.electricBlue, child: Text('JS')),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('João Silva', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  Text('Projeto: Atacadão', style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                ],
              ),
            ],
          ),
          const Divider(height: 40, color: Colors.white10),
          const Expanded(child: Center(child: Text('Selecione uma mensagem para responder', style: TextStyle(color: Colors.white24)))),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: 'Digite sua resposta...',
              filled: true,
              fillColor: AppColors.spaceBlack,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
              suffixIcon: const Icon(Icons.send, color: AppColors.neonCyan),
            ),
          ),
        ],
      ),
    );
  }
}
