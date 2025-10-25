import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geography_geyser/core/app_colors.dart';
import 'package:geography_geyser/core/app_spacing.dart';
import 'package:geography_geyser/core/app_strings.dart';
import 'package:geography_geyser/core/font_manager.dart';
import 'package:geography_geyser/views/custom_widgets/buildTextField.dart';
import 'package:geography_geyser/views/custom_widgets/custom_login_button.dart';

class GeneralSettings_Screen extends StatefulWidget {
  const GeneralSettings_Screen({super.key});

  @override
  State<GeneralSettings_Screen> createState() => _GeneralSettings_ScreenState();
}

class _GeneralSettings_ScreenState extends State<GeneralSettings_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.generalSetting, style: FontManager.titleText()),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 50.r,
                      backgroundImage: AssetImage(
                        "assets/images/man.png",
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 4,
                      child: CircleAvatar(
                        radius: 16.r,
                        backgroundColor: AppColors.buttonColor,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 18.sp,
                        ),
                      ),
                    ),
                  ],
                ),

                AppSpacing.h8,
                Text(
                  AppStrings.choosePhoto,
                  style: FontManager.titleText(color: AppColors.blue),
                ),
                AppSpacing.h40,
                BuildTextField(
                  label: AppStrings.nameLabel,
                  hint: AppStrings.nameFieldValue,
                ),
                AppSpacing.h12,
                BuildTextField(
                  label: AppStrings.emailLabel,
                  hint: AppStrings.emailFieldValue,
                ),
                AppSpacing.h12,
                BuildTextField(
                  label: AppStrings.currentPasswordLabel,
                  hint: AppStrings.currentPasswordEditLabel,
                ),
                AppSpacing.h32,
                CustomLoginButton(
                  text: AppStrings.saveChangesButton,
                  onPressed: () {
                    debugPrint("Save Changes Pressed");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
