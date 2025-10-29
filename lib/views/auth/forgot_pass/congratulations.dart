import 'package:flutter/material.dart';
import 'package:geography_geyser/core/app_spacing.dart';
import 'package:geography_geyser/core/app_strings.dart';
import 'package:geography_geyser/core/font_manager.dart';
import 'package:geography_geyser/custom_widgets/elevated_button.dart';

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            children: [
              AppSpacing.h80,
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/icons/success.png",
                      height: 152,
                      width: 152,
                    ),
                    AppSpacing.h16,
                    Text(
                      AppStrings.passChanged,
                      style: FontManager.boldHeading(),
                    ),
                    AppSpacing.h12,
                    Text(
                      AppStrings.passSubtitle,
                      textAlign: TextAlign.center,
                      style: FontManager.subtitleText(fontSize: 18),
                    ),
                    AppSpacing.h18,
                    ElevatedButtonCustom(
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      text:AppStrings.backToLogin,
                      backgroundColor: Colors.blue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
