import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/constants/premium_theme.dart';

void main() async {
  runApp(const CheckFastApp());
}

class CheckFastApp extends StatelessWidget {
  const CheckFastApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CheckFast',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.premiumLight,
      darkTheme: AppTheme.premiumDark,
      themeMode: ThemeMode.system,
      home: const DashboardView(),
    );
  }
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle_outline, size: 80, color: AppColors.primaryBlue),
            const SizedBox(height: 20),
            Text(
              'CheckFast',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.darkBlue,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'presença comprovada, pagamento garantido.',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.neutralGray,
              ),
            ),
            const SizedBox(height: 40),
            CircularProgressIndicator(color: AppColors.primaryBlue),
          ],
        ),
      ),
    );
  }
}
