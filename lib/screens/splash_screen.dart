import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.splashGradientStart,
              AppColors.splashGradientEnd,
            ],
          ),
        ),
        child: Stack(
          children: [
            // Logo centered
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 200),
                child: Text(
                  'Foodgo',
                  style: AppTextStyles.logoSplash,
                ),
              ),
            ),
            // Big burger (Background/Left)
            Positioned(
              left: -20,
              bottom: -15,
              child: Image.asset(
                'assets/images/burgers/image 2.png',
                height: 225,
                fit: BoxFit.contain,
              ),
            ),
            // Small burger (Foreground/Right) — overlapping big burger
            Positioned(
              left: 100,
              bottom: 3,
              child: Image.asset(
                'assets/images/burgers/image 1.png',
                height: 140,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
