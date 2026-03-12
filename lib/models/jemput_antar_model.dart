class JemputAntarModel {
  final int transaksiId;
  final String alamat;
  final double biaya;
  final String status;

  JemputAntarModel({
    required this.transaksiId,
    required this.alamat,
    required this.biaya,
    required this.status,
  });

  factory JemputAntarModel.fromJson(Map<String, dynamic> json) {
    return JemputAntarModel(
      transaksiId: json['transaksi_id'],
      alamat: json['alamat'],
      biaya: (json['biaya'] as num).toDouble(),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transaksi_id': transaksiId,
      'alamat': alamat,
      'biaya': biaya,
      'status': status,
    };
  }
}