import 'package:flutter/material.dart';
import 'package:geography_geyser/core/app_spacing.dart';
import 'package:geography_geyser/core/app_strings.dart';
import 'package:geography_geyser/core/font_manager.dart';
import 'package:geography_geyser/custom_widgets/custom_q_quantity.dart';
import 'package:geography_geyser/views/custom_widgets/custom_login_button.dart';
import 'package:geography_geyser/views/modules/quiz_screen.dart';

class SelectQuantity_Screen extends StatefulWidget {
  const SelectQuantity_Screen({super.key});

  @override
  State<SelectQuantity_Screen> createState() => _SelectQuantity_ScreenState();
}

class _SelectQuantity_ScreenState extends State<SelectQuantity_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.selectQuantity, style: FontManager.appBarText()),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Custom_Q_quantity(question: 10),
                      AppSpacing.h8,
                      Custom_Q_quantity(question: 20, isSelected: true),
                      AppSpacing.h8,
                      Custom_Q_quantity(question: 30),
                      AppSpacing.h8,
                      Custom_Q_quantity(question: 40),
                      AppSpacing.h8,
                      Custom_Q_quantity(question: 50, isSelected: true),
                      AppSpacing.h8,
                      Custom_Q_quantity(question: 60),
                      AppSpacing.h8,
                      Custom_Q_quantity(question: 70, isSelected: true),
                      AppSpacing.h8,
                      Custom_Q_quantity(question: 80),
                    ],
                  ),
                ),
              ),

              /// Button at the bottom
              CustomLoginButton(
                text: AppStrings.continueButton,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizScreen()),
                  );
                },
              ),
              AppSpacing.h12,
            ],
          ),
        ),
      ),
    );
  }
}
