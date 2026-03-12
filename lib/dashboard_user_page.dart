import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardUserPage extends StatelessWidget {
  const DashboardUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF5C9DFF),
        title: Text(
          'Halo, Pelanggan 👋',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          /// STATUS CARD
          Container(
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
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Laundry sedang diproses',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1F2A44),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Estimasi selesai: 2 hari',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF7A8CA4),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: Color(0xFF7A8CA4),
                )
              ],
            ),
          ),

          const SizedBox(height: 24),

          /// LAUNDRY AKTIF
          Text(
            'Laundry Aktif',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: const Color(0xFF1F2A44),
            ),
          ),
          const SizedBox(height: 12),

          laundryCard(
            context,
            title: 'Laundry Bersih Jaya',
            status: 'Dicuci',
            color: Colors.orange,
          ),

          const SizedBox(height: 24),

          /// RIWAYAT
          Text(
            'Riwayat Laundry',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: const Color(0xFF1F2A44),
            ),
          ),
          const SizedBox(height: 12),

          laundryCard(
            context,
            title: 'Laundry Bersih Jaya',
            status: 'Selesai',
            color: Colors.green,
          ),
          laundryCard(
            context,
            title: 'Laundry Express',
            status: 'Selesai',
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  /// ================= CARD =================
  Widget laundryCard(
    BuildContext context, {
    required String title,
    required String status,
    required Color color,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const TrackingDetailPage(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Row(
          children: [
            const Icon(
              Icons.store,
              color: Color(0xFF5C9DFF),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF1F2A44),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    status,
                    style: GoogleFonts.poppins(
                      color: color,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Color(0xFF7A8CA4),
            )
          ],
        ),
      ),
    );
  }
}

/// ================= DETAIL TRACKING =================
class TrackingDetailPage extends StatelessWidget {
  const TrackingDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5C9DFF),
        title: Text(
          'Detail Tracking',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Laundry Bersih Jaya',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),

            trackingItem('Diterima Laundry', true),
            trackingItem('Sedang Dicuci', true),
            trackingItem('Dikeringkan', false),
            trackingItem('Siap Diambil / Diantar', false),
          ],
        ),
      ),
    );
  }

  Widget trackingItem(String title, bool done) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(
            done ? Icons.check_circle : Icons.radio_button_unchecked,
            color: done ? Colors.green : Colors.grey,
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: GoogleFonts.poppins(),
          ),
        ],
      ),
    );
  }
}