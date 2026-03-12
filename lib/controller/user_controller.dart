import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user_model.dart';

class UserController {
  final supabase = Supabase.instance.client;

  Future<void> createUser(UserModel user) async {
    await supabase.from('user').insert(user.toJson());
  }

  Future<List<UserModel>> getUsers() async {
    final response = await supabase.from('user').select();

    return (response as List)
        .map((e) => UserModel.fromJson(e))
        .toList();
  }

  Future<void> deleteUser(String noHp) async {
    await supabase.from('user').delete().eq('no_hp', noHp);
  }
}