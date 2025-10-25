import 'package:flutter/material.dart';
import 'package:geography_geyser/core/app_colors.dart';
import 'package:geography_geyser/core/app_spacing.dart';
import 'package:geography_geyser/core/app_strings.dart';
import 'package:geography_geyser/core/font_manager.dart';
import 'package:geography_geyser/custom_widgets/cutom_timer.dart';
import 'package:geography_geyser/views/custom_widgets/buildTextField.dart';
import 'package:geography_geyser/views/custom_widgets/custom_login_button.dart';
import 'package:geography_geyser/views/modules/select_quantity.dart';

class SelectTime_screen extends StatefulWidget {
  const SelectTime_screen({super.key});

  @override
  State<SelectTime_screen> createState() => _SelectTime_screenState();
}

class _SelectTime_screenState extends State<SelectTime_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.selectTimeTitle,
          style: FontManager.appBarText(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AppSpacing.h16,
                      CustomModTimer(minutes: 5, isSelected: true),
                      AppSpacing.h8,
                      CustomModTimer(minutes: 10),
                      AppSpacing.h8,
                      CustomModTimer(minutes: 15),
                      AppSpacing.h8,
                      CustomModTimer(minutes: 20),
                      AppSpacing.h8,
                      CustomModTimer(minutes: 25),
                      AppSpacing.h8,
                      CustomModTimer(minutes: 30),
                      AppSpacing.h8,
                      // Add more timers if needed
                      AppSpacing.h12,
                      BuildTextField(
                        label: AppStrings.customizeTimeLabel,
                        hint: "EX: 12 Minutes",
                        bgcolor: AppColors.white,
                      ),
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
                    MaterialPageRoute(
                      builder: (context) => SelectQuantity_Screen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
