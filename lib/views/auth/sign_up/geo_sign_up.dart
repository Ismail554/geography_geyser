import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geography_geyser/core/app_colors.dart';
import 'package:geography_geyser/core/app_spacing.dart';
import 'package:geography_geyser/core/app_strings.dart';
import 'package:geography_geyser/core/font_manager.dart';
import 'package:geography_geyser/views/custom_widgets/buildTextField.dart';
import 'package:geography_geyser/views/custom_widgets/google_login_btn.dart';
import 'package:geography_geyser/views/custom_widgets/custom_login_button.dart';
import 'package:geography_geyser/views/auth/login/login.dart';
import 'package:geography_geyser/views/auth/sign_up/verify_otp.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert'; // JSON decode korar jonno

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

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;

  // Register function with API integration
  Future<void> registerUser(
    String fullName,
    String email,
    String password,
  ) async {
    final url = Uri.parse(
      "https://dihydric-yael-therianthropic.ngrok-free.dev", //  API URL
    );
    final body = jsonEncode({
      'email': email,
      'full_name': fullName,
      'password': password,
    });
    final headers = {'Content-Type': 'application/json'};

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 201) {
        // Status code 201 indicates created successfully
        final responseData = jsonDecode(response.body);
        print('Success: ${responseData['message']}');

        // ID and Verification Token
        String userId = responseData['user']['id'];
        String verificationToken = responseData['verificationToken'];

        // Store the ID and token using SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_id', userId);
        await prefs.setString('verification_token', verificationToken);

        debugPrint('User registered successfully, data stored.');
      } else {
        print('Error: ${response.statusCode}');
        print('Message: ${response.body}');
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  // Dispose controllers to avoid memory leaks
  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // Validation Function
  bool validateFields() {
    if (_fullNameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      return false;
    }
    if (_passwordController.text != _confirmPasswordController.text) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBG,
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
                    // shape: BoxShape.circle,
                    // border: Border.all(
                    //   color: const Color(0xFF4CAF50),
                    //   width: 4,
                    // ),
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
                    AppStrings.appName,
                    style: FontManager.splashTitle(fontSize: 24.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
                AppSpacing.h24,
              ],
            ),

            // White rounded container with form
            Container(
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
                        AppStrings.signUpButton,

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
                      label: AppStrings.fullNameLabel,
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
                      obscureText: _obscurePassword,
                      hint: 'Enter Password',
                      controller: _passwordController,
                      isPassword: true,
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

                          // Re-validate confirm password when password changes
                          if (_confirmPasswordController.text.isNotEmpty) {
                            if (_confirmPasswordController.text != value) {
                              _confirmPasswordError = 'Passwords do not match';
                            } else {
                              _confirmPasswordError = null;
                            }
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
                    AppSpacing.h16,

                    // Confirm Password Field
                    BuildTextField(
                      label: 'Confirm Password',
                      hint: 'Enter Password',
                      obscureText: _obscureConfirmPassword,
                      controller: _confirmPasswordController,
                      isPassword: true,
                      errorText: _confirmPasswordError,
                      onChanged: (value) {
                        setState(() {
                          if (value.isEmpty) {
                            _confirmPasswordError =
                                'Confirm password is required';
                          } else if (value != _passwordController.text) {
                            _confirmPasswordError = 'Passwords do not match';
                          } else {
                            _confirmPasswordError = null;
                          }
                        });
                      },
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: const Color(0xFF42A5F5),
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
                    ),
                    AppSpacing.h16,

                    // Sign Up Button
                    CustomLoginButton(
                      onPressed: () {
                        // Trigger validations if fields are empty
                        setState(() {
                          if (_emailController.text.isEmpty) {
                            _emailError = 'Email is required';
                          }
                          if (_passwordController.text.isEmpty) {
                            _passwordError = 'Password is required';
                          }
                          if (_confirmPasswordController.text.isEmpty) {
                            _confirmPasswordError =
                                'Confirm password is required';
                          }
                          // Basic format checks
                          if (_emailController.text.isNotEmpty &&
                              !_emailController.text.contains('@')) {
                            _emailError = 'Please enter a valid email';
                          }
                          if (_passwordController.text.isNotEmpty &&
                              _passwordController.text.length < 6) {
                            _passwordError =
                                'Password must be at least 6 characters';
                          }
                          if (_confirmPasswordController.text.isNotEmpty &&
                              _confirmPasswordController.text !=
                                  _passwordController.text) {
                            _confirmPasswordError = 'Passwords do not match';
                          }
                        });

                        final isValid =
                            _emailError == null &&
                            _passwordError == null &&
                            _confirmPasswordError == null &&
                            _emailController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty &&
                            _confirmPasswordController.text.isNotEmpty;

                        if (isValid) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerifyOtpScreen(),
                            ),
                          );
                        }
                      },
                      text: AppStrings.signUpButton,
                    ),
                    AppSpacing.h20,

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
                    AppSpacing.h20,

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
                                color: Color(0xFF42A5F5),
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
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
