import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih/constants/color.dart';
import 'package:sih/di/locator.dart';
import 'package:sih/pages/splash/splash.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          fontFamily: "Montserrat",
        ),
        darkTheme: ThemeData(
          indicatorColor: AppColors.primaryColor,
          brightness: Brightness.dark,
          primaryColor: AppColors.primaryColor,
          scaffoldBackgroundColor: AppColors.bgColor,
          backgroundColor: AppColors.bgColor,
          fontFamily: "Montserrat",
          textSelectionTheme:
              const TextSelectionThemeData(cursorColor: AppColors.primaryColor),
        ),
        themeMode: ThemeMode.dark,
        home: const SplashPage());
  }
}
