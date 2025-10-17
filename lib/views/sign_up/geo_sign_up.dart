import 'dart:isolate';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geography_geyser/core/app_colors.dart';

import 'package:geography_geyser/core/app_spacing.dart';
import 'package:geography_geyser/core/font_manager.dart';
import 'package:geography_geyser/views/custom_widgets/buildTextField.dart';
import 'package:geography_geyser/views/custom_widgets/google_login_btn.dart';

import 'package:geography_geyser/views/login/login.dart';

class GeoSignUpScreen extends StatefulWidget {
  const GeoSignUpScreen({super.key});

  @override
  State<GeoSignUpScreen> createState() => _GeoSignUpScreenState();
}

class _GeoSignUpScreenState extends State<GeoSignUpScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile section
            AppSpacing.h64,
            Column(
              children: [
                // Circular profile image with border
                Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF4CAF50),
                      width: 4,
                    ),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                AppSpacing.h16,
                // Name and title
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'GEOGRAPHY \n     Geyser',
                    style: FontManager.titleText(),
                    //  TextStyle(
                    //   fontSize: 18.sp,
                    //   fontWeight: FontWeight.bold,
                    //   color: Colors.black,
                    // ),
                  ),
                ),

                AppSpacing.h24,
              ],
            ),

            // White rounded container with form
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(120.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Create account title
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'Create account',
                        style: TextStyle(
                          fontFamily: 'SegoeUI',
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    AppSpacing.h16,

                    // Full Name Field
                    BuildTextField(
                      label: 'Full Name',
                      hint: 'Enter Full Name',
                      controller: _fullNameController,
                    ),
                    AppSpacing.h16,

                    // Email Field
                    BuildTextField(
                      label: 'Email',
                      hint: 'Enter Email',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    AppSpacing.h16,

                    // Password Field
                    BuildTextField(
                      label: 'Password',
                      hint: 'Enter Password',
                      controller: _passwordController,
                      isPassword: true,
                    ),
                    AppSpacing.h16,

                    // Confirm Password Field
                    BuildTextField(
                      label: 'Confirm Password',
                      hint: 'Enter Password',
                      controller: _confirmPasswordController,
                      isPassword: true,
                    ),
                    AppSpacing.h16,

                    // Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      height: 48.h,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle sign up
                          debugPrint('Sign Up Pressed');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF42A5F5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // OR divider
                    Row(
                      children: [
                        Expanded(
                          child: Divider(color: Colors.grey[300], thickness: 1),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Text(
                            'OR Login With',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(color: Colors.grey[300], thickness: 1),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),

                    // Google Login Button
                    GoogleLoginBtn(),
                    AppSpacing.h16,

                    // Login link
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have Account? ',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.grey[600],
                          ),
                          children: [
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: const Color(0xFF42A5F5),
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppSpacing.h16,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//   Widget BuildTextField({
//     required String label,
//     required String hint,
//     required TextEditingController controller,
//     TextInputType keyboardType = TextInputType.text,
//     bool isPassword = false,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontFamily: 'SegoeUI',
//             fontSize: 16.sp,
//             fontWeight: FontWeight.w500,
//             color: Colors.black,
//           ),
//         ),
//         SizedBox(height: 8.h),
//         TextField(
//           controller: controller,
//           keyboardType: keyboardType,
//           obscureText: isPassword,
//           decoration: InputDecoration(
//             hintText: hint,
//             hintStyle: TextStyle(fontSize: 13.sp, color: Colors.grey[400]),
//             contentPadding: EdgeInsets.symmetric(
//               horizontal: 16.w,
//               vertical: 12.h,
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12.r),
//               borderSide: BorderSide(color: Colors.grey[300]!, width: 1.5),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12.r),
//               borderSide: BorderSide(color: Colors.grey[300]!, width: 1.5),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12.r),
//               borderSide: const BorderSide(color: Color(0xFF42A5F5), width: 2),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
