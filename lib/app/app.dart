import 'package:flutter/material.dart';
import '../core/utils/app_colors.dart';
import '../features/home/persentation/ui/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      theme: ThemeData(scaffoldBackgroundColor: AppColors.background),
      builder: (_, child) =>
          Directionality(textDirection: TextDirection.rtl, child: child!),
      home: const Home(),
    );
  }
}
