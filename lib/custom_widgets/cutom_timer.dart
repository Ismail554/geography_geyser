import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geography_geyser/core/font_manager.dart';

class CustomModTimer extends StatelessWidget {
  final int minutes;
  final VoidCallback? onPressed;
  final bool isSelected;

  const CustomModTimer({
    super.key,
    required this.minutes,
    this.onPressed,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 12.w),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE8F4FF) : const Color(0xFFF5FBFF),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? Colors.blueAccent : Colors.grey.shade300,
            width: isSelected ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            "$minutes MINUTES",
            style: FontManager.headerSubtitleText(
              fontSize: 16.sp,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
