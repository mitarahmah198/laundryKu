import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/tracking_model.dart';

class TrackingController {
  final supabase = Supabase.instance.client;

  Future<void> addTracking(TrackingModel tracking) async {
    await supabase.from('tracking').insert(tracking.toJson());
  }

  Future<List<TrackingModel>> getTracking(int transaksiId) async {
    final response = await supabase
        .from('tracking')
        .select()
        .eq('transaksi_id', transaksiId);

    return (response as List)
        .map((e) => TrackingModel.fromJson(e))
        .toList();
  }
}