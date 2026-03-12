import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/jemput_antar_model.dart';

class JemputAntarController {
  final supabase = Supabase.instance.client;

  // Tambah data jemput antar
  Future<void> createJemputAntar(JemputAntarModel jemput) async {
    await supabase
        .from('jemput_antar')
        .insert(jemput.toJson());
  }

  // Ambil semua data jemput antar
  Future<List<JemputAntarModel>> getJemputAntar() async {
    final response = await supabase
        .from('jemput_antar')
        .select();

    return (response as List)
        .map((e) => JemputAntarModel.fromJson(e))
        .toList();
  }

  // Ambil berdasarkan transaksi
  Future<List<JemputAntarModel>> getByTransaksi(int transaksiId) async {
    final response = await supabase
        .from('jemput_antar')
        .select()
        .eq('transaksi_id', transaksiId);

    return (response as List)
        .map((e) => JemputAntarModel.fromJson(e))
        .toList();
  }

  // Update status jemput antar
  Future<void> updateStatus(int transaksiId, String status) async {
    await supabase
        .from('jemput_antar')
        .update({'status': status})
        .eq('transaksi_id', transaksiId);
  }

  // Hapus data jemput antar
  Future<void> deleteJemputAntar(int transaksiId) async {
    await supabase
        .from('jemput_antar')
        .delete()
        .eq('transaksi_id', transaksiId);
  }
}