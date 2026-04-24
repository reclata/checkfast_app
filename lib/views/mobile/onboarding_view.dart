import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'title': 'Vagas Perto de Você',
      'description': 'Encontre as melhores demandas de trade marketing baseadas na sua localização atual.',
      'icon': '📍',
    },
    {
      'title': 'Segurança Facial',
      'description': 'Garantimos a sua presença com tecnologia de ponta. Basta uma selfie para começar.',
      'icon': '📸',
    },
    {
      'title': 'Pagamento Automático',
      'description': 'Trabalhou mais de 4 horas? Seu pagamento cai direto no PIX sem burocracia.',
      'icon': '💸',
    },
    {
      'title': 'Suba no Ranking',
      'description': 'Seja um promotor 5 estrelas e tenha acesso antecipado às melhores vagas.',
      'icon': '⭐',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_pages[index]['icon']!, style: const TextStyle(fontSize: 100)),
                    const SizedBox(height: 40),
                    Text(_pages[index]['title']!, style: AppTextStyles.title.copyWith(color: Colors.white, fontSize: 28), textAlign: TextAlign.center),
                    const SizedBox(height: 20),
                    Text(_pages[index]['description']!, style: const TextStyle(color: Colors.white70, fontSize: 16), textAlign: TextAlign.center),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('PULAR', style: TextStyle(color: Colors.white54)),
                ),
                Row(
                  children: List.generate(_pages.length, (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 20 : 8,
                    height: 8,
                    decoration: BoxDecoration(color: _currentPage == index ? AppColors.cyan : Colors.white38, borderRadius: BorderRadius.circular(4)),
                  )),
                ),
                TextButton(
                  onPressed: () {
                    if (_currentPage < _pages.length - 1) {
                      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                    }
                  },
                  child: Text(_currentPage == _pages.length - 1 ? 'COMEÇAR' : 'PRÓXIMO', style: const TextStyle(color: AppColors.cyan, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
