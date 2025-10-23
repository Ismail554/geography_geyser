import 'dart:isolate';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geography_geyser/core/app_colors.dart';
import 'package:geography_geyser/core/app_spacing.dart';
import 'package:geography_geyser/core/font_manager.dart';
import 'package:geography_geyser/views/custom_widgets/buildTextField.dart';
import 'package:geography_geyser/views/custom_widgets/google_login_btn.dart';
import 'package:geography_geyser/views/auth/login/login.dart';
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

  // Register function with API integration
  Future<void> registerUser(
    String fullName,
    String email,
    String password,
  ) async {
    final url = Uri.parse(
      "https://dihydric-yael-therianthropic.ngrok-free.dev", // Your API URL
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
                    'GEOGRAPHY \n     Geyser'.toUpperCase(),
                    style: FontManager.titleText(),
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
                      obscureText: true,
                      hint: 'Enter Password',
                      controller: _passwordController,
                      isPassword: true,
                    ),
                    AppSpacing.h16,

                    // Confirm Password Field
                    BuildTextField(
                      label: 'Confirm Password',
                      hint: 'Enter Password',
                      obscureText: true,
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
                          if (validateFields()) {
                            // Call the register API
                            registerUser(
                              _fullNameController.text,
                              _emailController.text,
                              _passwordController.text,
                            );
                          } else {
                            // Show validation error
                            debugPrint('Please fill in all fields correctly');
                          }
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
                                color: const Color(0xFF42A5F5),
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
