import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminOrderPage extends StatelessWidget {
  const AdminOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5C9DFF),
        title: Text('Order Laundry', style: GoogleFonts.poppins()),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          orderCard(
            customer: 'Andi',
            status: 'Baru Masuk',
            color: Colors.blue,
          ),
          orderCard(
            customer: 'Siti',
            status: 'Dicuci',
            color: Colors.orange,
          ),
          orderCard(
            customer: 'Budi',
            status: 'Siap Diambil',
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  Widget orderCard({
    required String customer,
    required String status,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.person, color: Color(0xFF5C9DFF)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customer,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1F2A44),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  status,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Color(0xFF7A8CA4)),
        ],
      ),
    );
  }
}