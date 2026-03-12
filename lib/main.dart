import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry/admin_main_page.dart';
import 'package:laundry/dashboard_admin_page.dart';
import 'package:laundry/dashboard_user_page.dart';
import 'package:laundry/user_main_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

 await Supabase.initialize(
   url: 'https://kibohtmscsmuuadsxfrd.supabase.co',
  anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtpYm9odG1zY3NtdXVhZHN4ZnJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzMzMDEyMjEsImV4cCI6MjA4ODg3NzIyMX0.P758LAprHdnqsLaOIUMzTH27uHJEXFlog0mufCWdkEs',
);

  runApp(const LaundryKuApp());
}

class LaundryKuApp extends StatelessWidget {
  const LaundryKuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LaundryKu',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF4F8FF),
        primaryColor: const Color(0xFF5C9DFF),
        textTheme: GoogleFonts.poppinsTextTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF5C9DFF),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: const AdminMainPage(),
    );
  }
}