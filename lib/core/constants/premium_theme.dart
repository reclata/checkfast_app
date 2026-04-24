import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Paleta Dark (Alta Tecnologia)
  static const Color spaceBlack = Color(0xFF0B0E14);
  static const Color cardDark = Color(0xFF161B22);
  static const Color glassBorderDark = Color(0xFF30363D);

  // Paleta Light (Clean & Professional)
  static const Color surfaceLight = Color(0xFFF8FAFC);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color glassBorderLight = Color(0xFFE2E8F0);

  // Cores de Ação (Comuns)
  static const Color electricBlue = Color(0xFF007BFF);
  static const Color neonCyan = Color(0xFF00F2FF);
  static const Color successEmerald = Color(0xFF2ECC71);
  static const Color textWhite = Color(0xFFF0F6FC);
  static const Color textBlack = Color(0xFF1A1D23);
  static const Color textSecondary = Color(0xFF8B949E);
}

class AppTheme {
  // TEMA ESCURO (DEEP SPACE)
  static ThemeData get premiumDark {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.spaceBlack,
      cardColor: AppColors.cardDark,
      fontFamily: GoogleFonts.outfit().fontFamily,
      dividerColor: AppColors.glassBorderDark,
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.outfit(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.textWhite),
        bodyMedium: GoogleFonts.outfit(fontSize: 16, color: AppColors.textSecondary),
      ),
    );
  }

  // TEMA CLARO (CLEAN TECH)
  static ThemeData get premiumLight {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.surfaceLight,
      cardColor: AppColors.cardLight,
      fontFamily: GoogleFonts.outfit().fontFamily,
      dividerColor: AppColors.glassBorderLight,
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.outfit(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.textBlack),
        bodyMedium: GoogleFonts.outfit(fontSize: 16, color: AppColors.textSecondary),
      ),
    );
  }
}

class PremiumCard extends StatelessWidget {
  final Widget child;
  const PremiumCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardGrey,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.glassBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: child,
      ),
    );
  }
}

class TechLayoutView extends StatelessWidget {
  const TechLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.premiumDark,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('CheckFast', style: GoogleFonts.outfit(color: AppColors.neonCyan, fontWeight: FontWeight.w900, fontSize: 24, letterSpacing: 1.5)),
                        const Text('SISTEMA DE AUDITORIA VIVA'),
                      ],
                    ),
                    const CircleAvatar(
                      backgroundColor: AppColors.glassBorder,
                      child: Icon(Icons.person_outline, color: AppColors.textWhite),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Text('Olá, Carlos', style: GoogleFonts.outfit(fontSize: 32, fontWeight: FontWeight.bold)),
                const Text('Seu ecossistema está operando em 100%.'),
                const SizedBox(height: 30),
                
                // Card de Destaque com Gradiente Glassmorphism
                PremiumCard(
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.electricBlue, Color(0xFF0056B3)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('SALDO DISPONÍVEL', style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold)),
                            Icon(Icons.account_balance_wallet_outlined, color: Colors.white.withOpacity(0.5)),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text('R\$ 14.500,80', style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(20)),
                          child: const Text('▲ 12% este mês', style: TextStyle(color: AppColors.successEmerald, fontSize: 12, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 30),
                const Text('AÇÕES RÁPIDAS', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1)),
                const SizedBox(height: 15),
                
                Row(
                  children: [
                    Expanded(
                      child: _buildActionCard(Icons.add_task, 'Nova Vaga', AppColors.electricBlue),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: _buildActionCard(Icons.qr_code_scanner, 'Auditoria', AppColors.neonCyan),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionCard(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardGrey,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 10),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        ],
      ),
    );
  }
}
