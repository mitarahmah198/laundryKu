class LaundryModel {
  final int laundryId;
  final String namaLaundry;
  final String? alamat;
  final String? noHpLaundry;
  final int estimasiHari;

  LaundryModel({
    required this.laundryId,
    required this.namaLaundry,
    this.alamat,
    this.noHpLaundry,
    required this.estimasiHari,
  });

  factory LaundryModel.fromJson(Map<String, dynamic> json) {
    return LaundryModel(
      laundryId: json['laundry_id'],
      namaLaundry: json['nama_laundry'],
      alamat: json['alamat'],
      noHpLaundry: json['no_hp_laundry'],
      estimasiHari: json['estimasi_hari'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'laundry_id': laundryId,
      'nama_laundry': namaLaundry,
      'alamat': alamat,
      'no_hp_laundry': noHpLaundry,
      'estimasi_hari': estimasiHari,
    };
  }
}