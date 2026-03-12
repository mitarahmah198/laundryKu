class TransaksiModel {
  final int transaksiId;
  final String? noHp;
  final int laundryId;
  final double berat;
  final double hargaTotal;
  final String status;
  final String metode;

  TransaksiModel({
    required this.transaksiId,
    this.noHp,
    required this.laundryId,
    required this.berat,
    required this.hargaTotal,
    required this.status,
    required this.metode,
  });

  factory TransaksiModel.fromJson(Map<String, dynamic> json) {
    return TransaksiModel(
      transaksiId: json['transaksi_id'],
      noHp: json['no_hp'],
      laundryId: json['laundry_id'],
      berat: (json['berat'] as num).toDouble(),
      hargaTotal: (json['harga_total'] as num).toDouble(),
      status: json['status'],
      metode: json['metode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'no_hp': noHp,
      'laundry_id': laundryId,
      'berat': berat,
      'harga_total': hargaTotal,
      'status': status,
      'metode': metode,
    };
  }
}