import 'package:flutter/material.dart';
import 'package:medminder_navigation/models/medicine.dart';
import 'package:medminder_navigation/screens/home_screen.dart';
import 'package:medminder_navigation/screens/medicine_detail_screen.dart';

void main() {
  runApp(const MedMinderNavigationApp());
}

class MedMinderNavigationApp extends StatelessWidget {
  const MedMinderNavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seedColor = Color(0xFF087F75);

    return MaterialApp(
      title: 'MedMinder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F7F2),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF4F7F2),
          surfaceTintColor: Colors.transparent,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        MedicineDetailScreen.routeName: (context) =>
            const MedicineDetailScreen(medicine: Medicine.sample),
      },
    );
  }
}