import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geography_geyser/core/app_colors.dart';
import 'package:geography_geyser/core/app_spacing.dart';
import 'package:geography_geyser/core/app_strings.dart';
import 'package:geography_geyser/core/font_manager.dart';
import 'package:geography_geyser/views/home/homepage.dart';
import 'package:geography_geyser/views/modules/quiz_result.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top section (close button + quiz info)
                    IconButton(
                      icon: Icon(Icons.close, color: AppColors.black),
                      onPressed: () {
                        showCancelQuizDialog(context);
                      },
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        AppStrings.quizTitleMigrations,
                        style: FontManager.buttonTextRegular().copyWith(
                          color: AppColors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    AppSpacing.h12,

                    // Question info row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.questionNumberFormat,
                          style: FontManager.bodyText(),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: AppColors.blue,
                              size: 16.sp,
                            ),
                            AppSpacing.w4,
                            Text(
                              '04:56',
                              style: FontManager.bodyText().copyWith(
                                color: AppColors.blue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            AppSpacing.w16,
                            Text(
                              'Left: 27',
                              style: FontManager.bodyText().copyWith(
                                color: AppColors.red,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    AppSpacing.h20,

                    // Question text
                    Text(
                      AppStrings.questionWhatIsMigration,
                      style: FontManager.boldHeading(
                        fontSize: 20,
                        color: AppColors.black,
                      ),
                    ),
                    AppSpacing.h24,

                    // Options
                    Custom_Q_choice(
                      AppStrings.optionAWaterCycle,
                      AppColors.white,
                    ),
                    AppSpacing.h12,
                    Custom_Q_choice(
                      AppStrings.optionBMovementOfPeople,
                      AppColors.green,
                    ),
                    AppSpacing.h12,
                    Custom_Q_choice(
                      AppStrings.optionCRockBreaking,
                      AppColors.white,
                    ),

                    AppSpacing.h12,
                    Custom_Q_choice(
                      AppStrings.optionDPlantProcess,
                      AppColors.red,
                    ),
                    AppSpacing.h20,
                  ],
                ),
              ),
            ),

            // Fixed navigation buttons at bottom
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              color: AppColors.bgColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.black,
                      side: BorderSide(color: AppColors.borderColor),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 12.h,
                      ),
                    ),
                    child: Text(AppStrings.prevButton),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizResult_Screen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonColor,
                      foregroundColor: AppColors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 12.h,
                      ),
                    ),
                    child: Text(AppStrings.nextButton),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCancelQuizDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: AlertDialog(
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            title: Text(
              AppStrings.cancelQuizConfirmationTitle,
              textAlign: TextAlign.center,
              style: FontManager.boldHeading(
                fontSize: 18,
                color: AppColors.black,
              ),
            ),
            content: Text(
              AppStrings.cancelQuizDeductionMessage,
              textAlign: TextAlign.center,
              style: FontManager.bodyText().copyWith(color: AppColors.grey4B),
            ),
            actions: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close dialog
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        foregroundColor: AppColors.black,
                        side: BorderSide(color: AppColors.blue),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Text(
                        AppStrings.cancelButton,
                        style: FontManager.buttonText(),
                      ),
                    ),
                  ),
                  AppSpacing.w12,
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close dialog
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePageScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.red,
                        foregroundColor: AppColors.white,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Text(
                        AppStrings.quitButton,
                        textAlign: TextAlign.center,
                        style: FontManager.buttonText().copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget Custom_Q_choice(String text, Color backgroundColor) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: backgroundColor == AppColors.white
              ? AppColors.borderColor
              : backgroundColor,
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: FontManager.bodyText().copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
      ),
    );
  }
}
