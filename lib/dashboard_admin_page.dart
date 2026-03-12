import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardAdminPage extends StatelessWidget {
  const DashboardAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF5C9DFF),
        title: Text(
          'Dashboard Laundry',
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
          /// RINGKASAN
          Row(
            children: [
              summaryCard(
                title: 'Order Aktif',
                value: '5',
                icon: Icons.local_laundry_service,
              ),
              const SizedBox(width: 12),
              summaryCard(
                title: 'Selesai Hari Ini',
                value: '3',
                icon: Icons.check_circle,
              ),
            ],
          ),

          const SizedBox(height: 24),

          /// ORDER MASUK
          Text(
            'Order Masuk',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: const Color(0xFF1F2A44),
            ),
          ),
          const SizedBox(height: 12),

          orderCard(
            context,
            customer: 'Andi',
            status: 'Baru Masuk',
            color: Colors.blue,
          ),
          orderCard(
            context,
            customer: 'Siti',
            status: 'Dicuci',
            color: Colors.orange,
          ),
          orderCard(
            context,
            customer: 'Budi',
            status: 'Siap Diambil',
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  /// ================= SUMMARY CARD =================
  Widget summaryCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Expanded(
      child: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: const Color(0xFF5C9DFF)),
            const SizedBox(height: 12),
            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1F2A44),
              ),
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 13,
                color: const Color(0xFF7A8CA4),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ================= ORDER CARD =================
  Widget orderCard(
    BuildContext context, {
    required String customer,
    required String status,
    required Color color,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const AdminOrderDetailPage(),
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
            const Icon(Icons.person, color: Color(0xFF5C9DFF)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    customer,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
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
            const Icon(Icons.chevron_right, color: Color(0xFF7A8CA4))
          ],
        ),
      ),
    );
  }
}

/// ================= DETAIL ORDER ADMIN =================
class AdminOrderDetailPage extends StatelessWidget {
  const AdminOrderDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5C9DFF),
        title: Text(
          'Detail Order',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pelanggan: Andi',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),

            statusButton('Diterima'),
            statusButton('Dicuci'),
            statusButton('Dikeringkan'),
            statusButton('Selesai'),
          ],
        ),
      ),
    );
  }

  Widget statusButton(String title) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF5C9DFF),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {},
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}