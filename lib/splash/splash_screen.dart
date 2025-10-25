import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:geography_geyser/core/app_colors.dart';
import 'package:geography_geyser/core/app_spacing.dart';
import 'package:geography_geyser/core/font_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBG,
      body: SafeArea(
        child: SingleChildScrollView(
          // ✅ Makes content scrollable if screen is short (landscape/small device)
          child: ConstrainedBox(
            // ✅ Ensures content takes at least full screen height
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.vertical,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FadeInDown(
                    duration: const Duration(seconds: 2),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 300,
                      fit: BoxFit.contain,
                    ),
                  ),
                  FadeInUp(
                    duration: const Duration(seconds: 2),
                    child: Text(
                      'Geography\nGeyser',
                      textAlign: TextAlign.center,
                      style: FontManager.splashTitle(),
                    ),
                  ),
                  AppSpacing.h26,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
