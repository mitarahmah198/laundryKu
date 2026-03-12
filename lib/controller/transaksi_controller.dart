import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/transaksi_model.dart';

class TransaksiController {
  final supabase = Supabase.instance.client;

  Future<void> createTransaksi(TransaksiModel transaksi) async {
    await supabase.from('transaksi').insert(transaksi.toJson());
  }

  Future<List<TransaksiModel>> getTransaksi() async {
    final response = await supabase.from('transaksi').select();

    return (response as List)
        .map((e) => TransaksiModel.fromJson(e))
        .toList();
  }

  Future<void> updateStatus(int id, String status) async {
    await supabase
        .from('transaksi')
        .update({'status': status})
        .eq('transaksi_id', id);
  }
}