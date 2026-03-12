import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/laundry_model.dart';

class LaundryController {
  final supabase = Supabase.instance.client;

  Future<List<LaundryModel>> getLaundry() async {
    final response = await supabase.from('laundry').select();

    return (response as List)
        .map((e) => LaundryModel.fromJson(e))
        .toList();
  }

  Future<void> addLaundry(LaundryModel laundry) async {
    await supabase.from('laundry').insert(laundry.toJson());
  }

  Future<void> deleteLaundry(int id) async {
    await supabase.from('laundry').delete().eq('laundry_id', id);
  }
}