class UserModel {
  final String noHp;
  final String nama;
  final String? alamat;
  final String password;
  final String role;

  UserModel({
    required this.noHp,
    required this.nama,
    this.alamat,
    required this.password,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      noHp: json['no_hp'],
      nama: json['nama'],
      alamat: json['alamat'],
      password: json['password'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'no_hp': noHp,
      'nama': nama,
      'alamat': alamat,
      'password': password,
      'role': role,
    };
  }
}