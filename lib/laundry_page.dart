import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaundryPage extends StatelessWidget {
  const LaundryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF5C9DFF),
        title: Text(
          'Laundry Saya',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// FILTER
            Row(
              children: [
                filterChip('Aktif', true),
                const SizedBox(width: 8),
                filterChip('Selesai', false),
              ],
            ),

            const SizedBox(height: 16),

            /// LIST LAUNDRY
            Expanded(
              child: ListView(
                children: [
                  laundryCard(
                    laundryName: 'Laundry Bersih Jaya',
                    status: 'Dicuci',
                    estimate: 'Estimasi 2 hari',
                    statusColor: Colors.orange,
                  ),
                  laundryCard(
                    laundryName: 'Laundry Express',
                    status: 'Disetrika',
                    estimate: 'Estimasi hari ini',
                    statusColor: Colors.blue,
                  ),
                  laundryCard(
                    laundryName: 'Laundry Bersih Jaya',
                    status: 'Selesai',
                    estimate: 'Siap diambil',
                    statusColor: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// FILTER CHIP
  Widget filterChip(String label, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: active ? const Color(0xFF5C9DFF) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF5C9DFF),
        ),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          color: active ? Colors.white : const Color(0xFF5C9DFF),
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  /// LAUNDRY CARD
  Widget laundryCard({
    required String laundryName,
    required String status,
    required String estimate,
    required Color statusColor,
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
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFE9F1FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.local_laundry_service,
              color: Color(0xFF5C9DFF),
            ),
          ),
          const SizedBox(width: 16),

          /// INFO
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  laundryName,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1F2A44),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  estimate,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xFF7A8CA4),
                  ),
                ),
              ],
            ),
          ),

          /// STATUS
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                status,
                style: GoogleFonts.poppins(
                  color: statusColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 8),
              const Icon(
                Icons.chevron_right,
                color: Color(0xFF7A8CA4),
              )
            ],
          ),
        ],
      ),
    );
  }
}