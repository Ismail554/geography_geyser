import 'package:flutter/material.dart';
import 'package:geography_geyser/core/app_colors.dart';
import 'package:geography_geyser/core/app_spacing.dart';
import 'package:geography_geyser/core/app_strings.dart';
import 'package:geography_geyser/core/font_manager.dart';
import 'package:geography_geyser/views/auth/forgot_pass/verify_screen.dart';
import 'package:geography_geyser/views/custom_widgets/buildTextField.dart';
import 'package:geography_geyser/views/custom_widgets/custom_login_button.dart';

class PassResetScreen extends StatefulWidget {
  const PassResetScreen({super.key});

  @override
  State<PassResetScreen> createState() => _PassResetScreenState();
}

class _PassResetScreenState extends State<PassResetScreen> {
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
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  AppSpacing.h56,
                  Text(
                    'Forgot your Password ?',
                    style: FontManager.titleText(),
                  ),
                  AppSpacing.h16,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      AppStrings.forgotPasswordInstruction,
                      style: FontManager.subtitleText(color: AppColors.black),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                    ),
                  ),
                  AppSpacing.h18,
                  // Text(AppStrings.emailLabel, style: FontManager.bodyText()),
                  // AppSpacing.h4,
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        BuildTextField(
                          label: "Email",
                          hint: "Enter your email",
                          prefixIcon: Icon(Icons.mail_outline_rounded),
                        ),
                        AppSpacing.h14,
                        CustomLoginButton(
                          text: "Send",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerifyScreen(),
                              ),
                            );
                          },
                        ),
                        AppSpacing.h10,
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            AppStrings.backToLogin,
                            style: FontManager.bodyText(color: AppColors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
