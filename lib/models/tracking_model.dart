class TrackingModel {
  final int transaksiId;
  final String status;

  TrackingModel({
    required this.transaksiId,
    required this.status,
  });

  factory TrackingModel.fromJson(Map<String, dynamic> json) {
    return TrackingModel(
      transaksiId: json['transaksi_id'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transaksi_id': transaksiId,
      'status': status,
    };
  }
}