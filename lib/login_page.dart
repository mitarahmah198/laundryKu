import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String selectedRole = 'user';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.local_laundry_service,
                size: 90,
                color: Color(0xFF5C9DFF),
              ),
              const SizedBox(height: 16),

              Text(
                'LaundryKu',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1F2A44),
                ),
              ),
              const SizedBox(height: 6),

              Text(
                'Login sesuai peran kamu',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: const Color(0xFF7A8CA4),
                ),
              ),

              const SizedBox(height: 32),

              /// ROLE SELECTOR
              Row(
                children: [
                  Expanded(
                    child: roleCard(
                      title: 'Pelanggan',
                      icon: Icons.person,
                      value: 'user',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: roleCard(
                      title: 'Pemilik Laundry',
                      icon: Icons.store,
                      value: 'admin',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              /// PHONE
              TextField(
                keyboardType: TextInputType.phone,
                decoration: inputDecoration(
                  hint: 'Nomor HP',
                  icon: Icons.phone,
                ),
              ),
              const SizedBox(height: 16),

              /// PASSWORD
              TextField(
                obscureText: true,
                decoration: inputDecoration(
                  hint: 'Password',
                  icon: Icons.lock,
                ),
              ),

              const SizedBox(height: 28),

              /// LOGIN BUTTON
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5C9DFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// REGISTER
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  );
                },
                child: Text(
                  'Belum punya akun? Daftar',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF5C9DFF),
                  ),
                ),
              )
                    ],
                  ),
                ),
              ),
            );
          }

  /// ROLE CARD WIDGET
  Widget roleCard({
    required String title,
    required IconData icon,
    required String value,
  }) {
    final isActive = selectedRole == value;

    return GestureDetector(
      onTap: () {
        setState(() => selectedRole = value);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF5C9DFF) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isActive ? Colors.white : const Color(0xFF5C9DFF),
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: isActive ? Colors.white : const Color(0xFF1F2A44),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration inputDecoration({
    required String hint,
    required IconData icon,
  }) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }
}