import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../Utilities/shared_preferences.dart';
import '../Login/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = '/onboarding';
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  static const List<Map<String, String>> _data = [
    {
      'title': ' Everything  is here to enjoy quiz!',
      'image': 'assets/svg/Group.svg',
    },
    {
      'title': 'Ready for challenge adrenaline!',
      'image': 'assets/svg/Frame.svg',
    },
    {
      'title': 'Test your knowledge, Answer & Win!',
      'image': 'assets/svg/Frame1.svg',
    },
  ];

  void _finishOnboarding() async {
    await SharedPref.setOnboardingSeen();
    if (mounted) context.go(LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 60), // مسافة من الأعلى
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _data.length,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                  if (index == _data.length - 1) {
                    Future.delayed(const Duration(milliseconds: 1500), () {
                      _finishOnboarding();
                    });
                  }
                },
                itemBuilder: (_, index) {
                  final item = _data[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item['title']!,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF212121),
                          height: 1.3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 50),
                      SvgPicture.asset(item['image']!, height: 250),
                      const SizedBox(height: 50),

                      // زر Login
                      ElevatedButton(
                        onPressed: () {
                          context.go(LoginScreen.routeName);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF37093A),
                          minimumSize: const Size(335, 64),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(64),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        child: const Text(
                          "Login to your account",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // زر Create Account
                      OutlinedButton(
                        onPressed: () {
                          // انتقلي لصفحة إنشاء حساب هنا
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(335, 64),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(64),
                          ),
                          side: const BorderSide(color: Colors.grey),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        child: const Text(
                          "Create account",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _data.length,
                    (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: _currentIndex == index ? 12 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentIndex == index ? Colors.deepPurple : Colors.grey[400],
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}