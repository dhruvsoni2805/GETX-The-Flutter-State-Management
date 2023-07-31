import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_tut/Fourth_screen.dart';
import 'package:get_x_tut/homescreen.dart';
import 'package:get_x_tut/lang.dart';
import 'package:get_x_tut/image_picker/image_picker.dart';
import 'package:get_x_tut/third_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      translations: AppLang(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   useMaterial3: true,
      // ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      theme: ThemeData.light(useMaterial3: true),
      // themeMode: ThemeMode.system,
      // theme: ThemeData(s
      //   floatingActionButtonTheme: const FloatingActionButtonThemeData(
      //     enableFeedback: true,
      //     backgroundColor: Colors.indigo,
      //     foregroundColor: Colors.white,
      //   ),
      //   primarySwatch: Colors.indigo,
      //   useMaterial3: true,
      // ),
      home: const HomeScreen(),
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: '/ImagePickerScreen',
          page: () => const ImagePickerScreen(),
        ),
        GetPage(
          name: '/ThirdScreen',
          page: () => const ThirdScreen(
            themevalue: false,
          ),
        ),
        GetPage(
          name: '/FourthScreen',
          page: () => const FourthScreen(),
        )
      ],
    );
  }
}
