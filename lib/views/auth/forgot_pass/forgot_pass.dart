import 'package:flutter/material.dart';
import 'package:geography_geyser/core/app_colors.dart';
import 'package:geography_geyser/core/app_spacing.dart';
import 'package:geography_geyser/core/app_strings.dart';
import 'package:geography_geyser/core/font_manager.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.resetPasswordTitle,
          style: FontManager.titleText(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                AppSpacing.h56,
                Text('Forgot your Password ?', style: FontManager.titleText()),
                AppSpacing.h16,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    AppStrings.forgotPasswordInstruction,
                    style: FontManager.subtitleText(color: AppColors.black),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  )
      ),
             ],
 
            ),
          ),
        ),
      ),
    );

  }
}
