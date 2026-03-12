import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF5C9DFF),
        title: Text(
          'Profil',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFFE9F1FF),
                  child: Icon(Icons.person, size: 40, color: Color(0xFF5C9DFF)),
                ),
                const SizedBox(height: 12),
                Text(
                  'Andi',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '0812xxxxxxx',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF7A8CA4),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          profileItem(Icons.edit, 'Edit Profil'),
          profileItem(Icons.location_on, 'Alamat'),
          profileItem(Icons.help_outline, 'Bantuan'),
          profileItem(Icons.logout, 'Logout', danger: true),
        ],
      ),
    );
  }

  Widget profileItem(IconData icon, String title, {bool danger = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: danger ? Colors.red : const Color(0xFF5C9DFF),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: GoogleFonts.poppins(
              color: danger ? Colors.red : const Color(0xFF1F2A44),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}