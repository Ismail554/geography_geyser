import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geography_geyser/core/app_colors.dart';
import 'package:geography_geyser/core/app_spacing.dart';
import 'package:geography_geyser/core/font_manager.dart';
import 'package:geography_geyser/views/auth/forgot_pass/forgot_pass.dart';
import 'package:geography_geyser/views/auth/forgot_pass/pass_reset.dart';
import 'package:geography_geyser/views/auth/sign_up/geo_sign_up.dart';
import 'package:geography_geyser/views/custom_widgets/buildTextField.dart';
import 'package:geography_geyser/views/custom_widgets/custom_login_button.dart';
import 'package:geography_geyser/views/custom_widgets/google_login_btn.dart';
import 'package:geography_geyser/views/home/homepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;
  String? _emailError;
  String? _passwordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppSpacing.h60,

                  // Logo & Title
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 18.h),
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
                      Text(
                        'GEOGRAPHY\nGEYSER',
                        style: FontManager.titleText(),
                        textAlign: TextAlign.center,
                      ),
                      AppSpacing.h24,
                    ],
                  ),

                  // Login Form Section
                  Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height * 0.80,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(130.r),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 30.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                        AppSpacing.h20,

                        // Email Field
                        BuildTextField(
                          label: 'Email',
                          hint: 'Enter your email',
                          controller: emailController,
                          errorText: _emailError,
                          onChanged: (value) {
                            setState(() {
                              if (value.isEmpty) {
                                _emailError = 'Email is required';
                              } else if (!value.contains('@')) {
                                _emailError = 'Please enter a valid email';
                              } else {
                                _emailError = null;
                              }
                            });
                          },
                        ),
                        AppSpacing.h16,

                        // Password Field
                        BuildTextField(
                          label: 'Password',
                          hint: 'Enter your password',
                          controller: passwordController,
                          isPassword: true,
                          obscureText: _obscurePassword,
                          errorText: _passwordError,
                          onChanged: (value) {
                            setState(() {
                              if (value.isEmpty) {
                                _passwordError = 'Password is required';
                              } else if (value.length < 6) {
                                _passwordError =
                                    'Password must be at least 6 characters';
                              } else {
                                _passwordError = null;
                              }
                            });
                          },
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color(0xFF42A5F5),
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        AppSpacing.h4,

                        // Forgot Password
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PassResetScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xFF42A5F5),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        AppSpacing.h20,

                        // Login Button
                        CustomLoginButton(
                          text: 'Login',
                          onPressed: () {
                            // Check if all fields are valid
                            if (_emailError == null &&
                                _passwordError == null &&
                                emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePageScreen(),
                                ),
                              );
                            }
                          },
                        ),
                        AppSpacing.h20,

                        // OR Divider
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.grey[300],
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Text(
                                'OR Login With',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey[300],
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        AppSpacing.h20,

                        // Google login
                       GoogleLoginBtn(),
                        AppSpacing.h16,

                        // Create Account
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: 'Don\'t have an account? ',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.grey[600],
                              ),
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const GeoSignUpScreen(),
                                        ),
                                      );
                                    },
                                  text: 'Create Account',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        AppSpacing.h24,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
