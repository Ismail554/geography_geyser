import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geography_geyser/core/app_colors.dart';
import 'package:geography_geyser/core/app_spacing.dart';
import 'package:geography_geyser/core/app_strings.dart';
import 'package:geography_geyser/core/font_manager.dart';
import 'package:geography_geyser/views/custom_widgets/custom_login_button.dart';
import 'package:geography_geyser/views/custom_widgets/module_selection_row.dart';
import 'package:geography_geyser/views/home/homepage.dart';

class OptionalModuleSettings extends StatefulWidget {
  const OptionalModuleSettings({super.key});

  @override
  State<OptionalModuleSettings> createState() => _OptionalModuleSettingsState();
}

class _OptionalModuleSettingsState extends State<OptionalModuleSettings> {
  // Track selections for each row
  bool row1LeftSelected = true; // COASTS selected
  bool row2RightSelected = true; // HHRI selected
  bool row3LeftSelected = false; // MIGRATION not selected
  bool row3RightSelected = false; // COASTS not selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppStrings.moduleSettingTitle,
          style: FontManager.titleText(),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacing.h20,

              // Title
              Text(
                AppStrings.selectOptionalModuleInstruction,
                style: FontManager.bigTitle(),
              ),
              AppSpacing.h32,

              // Module Selection Rows
              Expanded(
                child: Column(
                  children: [
                    // Row 1: COASTS OR COASTS
                    ModuleSelectionRow(
                      leftOption: AppStrings.moduleCoasts,
                      rightOption: AppStrings.moduleCoasts,
                      isLeftSelected: row1LeftSelected,
                      isRightSelected: !row1LeftSelected,
                      onSelectionChanged: (isLeft) {
                        setState(() {
                          row1LeftSelected = isLeft;
                        });
                      },
                    ),

                    AppSpacing.h16,

                    // Row 2: GLACIERS OR HHRI
                    ModuleSelectionRow(
                      leftOption: AppStrings.moduleGlaciers,
                      rightOption: AppStrings.moduleHHRI,
                      isLeftSelected: !row2RightSelected,
                      isRightSelected: row2RightSelected,
                      onSelectionChanged: (isLeft) {
                        setState(() {
                          row2RightSelected = !isLeft;
                        });
                      },
                    ),

                    AppSpacing.h16,

                    // Row 3: MIGRATION OR COASTS
                    ModuleSelectionRow(
                      leftOption: AppStrings.moduleMigrations,
                      rightOption: AppStrings.moduleCoasts,
                      isLeftSelected: row3LeftSelected,
                      isRightSelected: row3RightSelected,
                      onSelectionChanged: (isLeft) {
                        setState(() {
                          row3LeftSelected = isLeft;
                          row3RightSelected = !isLeft;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Divider(),

              AppSpacing.h40,

              // Back To Login Button
              CustomLoginButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePageScreen()),
                  );
                },
                text: AppStrings.goHome,
              ),

              AppSpacing.h20,
            ],
          ),
        ),
      ),
    );
  }
}
