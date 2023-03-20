import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/ui/dashbord.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  static Map<int, Color> color = {
    50: const Color(0xFF434343),
    100: const Color(0xFF434343),
    200: const Color(0xFF434343),
    300: const Color(0xFF434343),
    400: const Color(0xFF434343),
    500: const Color(0xFF434343),
    600: const Color(0xFF434343),
    700: const Color(0xFF434343),
    800: const Color(0xFF434343),
    900: const Color(0xFF434343),
  };
  MaterialColor primeColor = MaterialColor(0xFF434343, color);
  MaterialColor accentColor = MaterialColor(0xFF666666, color);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: primeColor,
          ),
          home: const DashbordPage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
