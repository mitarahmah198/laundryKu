import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminKasirPage extends StatelessWidget {
  const AdminKasirPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5C9DFF),
        title: Text('Kasir Laundry', style: GoogleFonts.poppins()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// INPUT NO HP
            inputField(
              'Nomor HP Pelanggan',
              icon: Icons.phone,
              keyboard: TextInputType.phone,
            ),

            /// BERAT
            inputField(
              'Berat Laundry (Kg)',
              icon: Icons.scale,
              keyboard: TextInputType.number,
            ),

            /// JENIS LAUNDRY
            inputField(
              'Jenis Laundry (Reguler / Express)',
              icon: Icons.local_laundry_service,
            ),

            const SizedBox(height: 16),

            /// TOTAL HARGA
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Harga',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Rp 25.000',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF5C9DFF),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// SIMPAN
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5C9DFF),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Simpan Transaksi',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget inputField(
    String hint, {
    required IconData icon,
    TextInputType keyboard = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        keyboardType: keyboard,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon, color: const Color(0xFF5C9DFF)),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}