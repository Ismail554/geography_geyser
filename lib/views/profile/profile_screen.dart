import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geography_geyser/core/app_colors.dart';
import 'package:geography_geyser/core/app_spacing.dart';
import 'package:geography_geyser/core/app_strings.dart';
import 'package:geography_geyser/core/font_manager.dart';
import 'package:geography_geyser/views/auth/login/login.dart';

class ProfileScreen extends StatelessWidget {
  final bool hideSettingsCard;

  const ProfileScreen({super.key, this.hideSettingsCard = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              Row(
                children: [
                  Icon(Icons.arrow_back, color: Colors.black),
                  SizedBox(width: 8.w),
                  Text(
                    'Back',
                    style: FontManager.bodyText(color: Colors.black),
                  ),
                ],
              ),

              AppSpacing.h24,

              // Profile Header
              buildProfileHeader(),

              AppSpacing.h24,

              // Settings Card (conditionally shown)
              if (!hideSettingsCard) ...[
                buildSettingsCard(context),
                AppSpacing.h24,
              ],

              // Progress Section
              buildProgressSection(),

              AppSpacing.h24,

              // Subject Performance Section
              buildSubjectPerformanceSection(),

              AppSpacing.h40,
            ],
          ),
        ),
      ),
    );
  }

  /// PROFILE HEADER
  Widget buildProfileHeader() {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50.r,
            backgroundImage: AssetImage('assets/images/man.png'),
          ),
          AppSpacing.h16,
          Text(AppStrings.userName, style: FontManager.bigTitle()),
          AppSpacing.h8,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.emoji_events_outlined,
                color: Colors.orange,
                size: 20.sp,
              ),
              AppSpacing.w8,
              Text(
                AppStrings.userXp,
                style: FontManager.bodyText(color: Colors.orange),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// SETTINGS CARD
  Widget buildSettingsCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          buildSettingRow(
            icon: Icons.person_outline,
            text: AppStrings.editProfileOption,
            onTap: () {},
          ),
          Divider(height: 1, color: Colors.grey[300]),
          buildSettingRow(
            icon: Icons.settings_outlined,
            text: AppStrings.moduleSettingOption,
            onTap: () {},
          ),
          Divider(height: 1, color: Colors.grey[300]),
          buildSettingRow(
            icon: Icons.logout_outlined,
            text: AppStrings.logOutOption,
            textColor: AppColors.buttonColor, // ✅ Themed logout color
            iconColor: AppColors.buttonColor,
            onTap: () => showLogoutDialog(context),
          ),
        ],
      ),
    );
  }

  Widget buildSettingRow({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    Color? textColor,
    Color? iconColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            Icon(icon, color: iconColor ?? Colors.black, size: 24.sp),
            AppSpacing.w16,
            Expanded(
              child: Text(
                text,
                style: FontManager.appBarText(color: textColor ?? Colors.black),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.grey[600], size: 16.sp),
          ],
        ),
      ),
    );
  }

  /// PROGRESS SECTION
  Widget buildProgressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.progressTitle, style: FontManager.bigTitle()),
        AppSpacing.h16,
        Column(
          children: [
            buildProgressCard(
              label: AppStrings.quizAttemptedLabel,
              value: AppStrings.quizAttemptedValue,
            ),
            AppSpacing.h12,
            buildProgressCard(
              label: AppStrings.averageScoreLabel,
              value: AppStrings.averageScoreValue,
            ),
            AppSpacing.h12,
            buildProgressCard(
              label: AppStrings.subjectCoveredLabel,
              value: AppStrings.subjectCoveredValue,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildProgressCard({required String label, required String value}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8.r, horizontal: 16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: FontManager.subtitleText()),
          AppSpacing.h8,
          Text(
            value,
            style: FontManager.bigTitle(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// SUBJECT PERFORMANCE
  Widget buildSubjectPerformanceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.subjectPerformanceTitle, style: FontManager.bigTitle()),
        AppSpacing.h16,
        Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              buildSubjectProgress(AppStrings.tectonicsSubject, 48),
              AppSpacing.h12,
              buildSubjectProgress(AppStrings.waterCycleSubject, 74),
              AppSpacing.h12,
              buildSubjectProgress(AppStrings.carbonCycleSubject, 54),
              AppSpacing.h12,
              buildSubjectProgress(AppStrings.globalisationSubject, 88),
              AppSpacing.h12,
              buildSubjectProgress(AppStrings.migrationSubject, 65),
              AppSpacing.h12,
              buildSubjectProgress(AppStrings.coastsSubject, 76),
              AppSpacing.h12,
              buildSubjectProgress(AppStrings.glaciersSubject, 35),
              AppSpacing.h12,
              buildSubjectProgress(AppStrings.regeneratingPlacesSubject, 52),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSubjectProgress(String subject, int percentage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(subject, style: FontManager.bodyText(color: Colors.black)),
            Text(
              '$percentage%',
              style: FontManager.bodyText(color: Colors.black),
            ),
          ],
        ),
        AppSpacing.h8,
        Container(
          height: 8.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: Colors.grey[200],
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: percentage / 100,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: AppColors.buttonColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// LOGOUT DIALOG
  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          title: Text(
            AppStrings.areYouSureTitle,
            style: FontManager.bigTitle(),
            textAlign: TextAlign.center,
          ),
          content: Text(
            AppStrings.logoutConfirmationMessage,
            style: FontManager.bodyText(),
            textAlign: TextAlign.center,
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    child: Text(
                      AppStrings.cancelButton,
                      style: FontManager.bodyText(color: Colors.black),
                    ),
                  ),
                ),
                AppSpacing.w12,
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    child: Text(
                      AppStrings.logOutButton,
                      style: FontManager.bodyText(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
