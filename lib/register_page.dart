import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String selectedRole = 'user';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF1F2A44)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Daftar Akun',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1F2A44),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Pilih peran kamu sebelum mendaftar',
              style: GoogleFonts.poppins(
                color: const Color(0xFF7A8CA4),
              ),
            ),

            const SizedBox(height: 24),

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

            TextField(
              decoration: inputDecoration('Nama Lengkap', Icons.person),
            ),
            const SizedBox(height: 16),

            TextField(
              keyboardType: TextInputType.phone,
              decoration: inputDecoration('Nomor HP', Icons.phone),
            ),
            const SizedBox(height: 16),

            TextField(
              obscureText: true,
              decoration: inputDecoration('Password', Icons.lock),
            ),
            const SizedBox(height: 16),

            TextField(
              obscureText: true,
              decoration:
                  inputDecoration('Konfirmasi Password', Icons.lock_outline),
            ),

            const SizedBox(height: 28),

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
                  'Daftar',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ROLE CARD
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
              size: 28,
              color: isActive ? Colors.white : const Color(0xFF5C9DFF),
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

  InputDecoration inputDecoration(String hint, IconData icon) {
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