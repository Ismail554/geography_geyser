import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geography_geyser/core/app_colors.dart';
import 'package:geography_geyser/core/app_spacing.dart';
import 'package:geography_geyser/core/app_strings.dart';
import 'package:geography_geyser/core/font_manager.dart';
import 'package:geography_geyser/custom_widgets/custom_module.dart';
import 'package:geography_geyser/views/home/homepage.dart';
import 'package:geography_geyser/views/modules/select_time.dart';

class ModuleHome_screen extends StatefulWidget {
  const ModuleHome_screen({super.key});

  @override
  State<ModuleHome_screen> createState() => _ModuleHome_screenState();
}

class _ModuleHome_screenState extends State<ModuleHome_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePageScreen()),
              (route) => false,
            );
          },
        ),
        title: Text(
          AppStrings.selectModuleTitle,
          style: FontManager.boldHeading(color: AppColors.black),
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomModule(text: AppStrings.tectonicsSubject, onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectTime_screen(),
                    ),
                  );
                },),
                AppSpacing.h14,
                CustomModule(text: AppStrings.coastsSubject),
                AppSpacing.h14,
                CustomModule(text: AppStrings.waterCycleSubject,),
                AppSpacing.h14,
                CustomModule(text: AppStrings.carbonCycleSubject),
                AppSpacing.h14,
                CustomModule(text: AppStrings.globalisationSubject),
                AppSpacing.h14,
                CustomModule(text: AppStrings.moduleSuperpowers),
                AppSpacing.h14,
                CustomModule(text: AppStrings.coastsSubject),
                AppSpacing.h14,
                CustomModule(text: AppStrings.waterCycleSubject),
                AppSpacing.h14,
                CustomModule(text: AppStrings.carbonCycleSubject),
                AppSpacing.h14,
                CustomModule(text: AppStrings.globalisationSubject),
                AppSpacing.h14,
                CustomModule(text: AppStrings.moduleSuperpowers),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
