import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geography_geyser/views/auth/forgot_pass/congratulations.dart';
import 'package:geography_geyser/views/auth/forgot_pass/verify_screen.dart';
import 'package:geography_geyser/views/auth/login/login.dart';
import 'package:geography_geyser/views/auth/sign_up/geo_sign_up.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: child,
      ),
      child: LoginScreen(),
    );
  }
}
