import 'dart:convert';

List<DiseaseModel> diseaseModelFromJson(String str) => List<DiseaseModel>.from(
    json.decode(str).map((x) => DiseaseModel.fromJson(x)));

String diseaseModelToJson(List<DiseaseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DiseaseModel {
  DiseaseModel({
    this.kodeIcd,
    this.namaIcd,
    this.namaIcdIndo,
  });

  String? kodeIcd;
  String? namaIcd;
  String? namaIcdIndo;

  factory DiseaseModel.fromJson(Map<String, dynamic> json) => DiseaseModel(
        kodeIcd: json["kode_icd"],
        namaIcd: json["nama_icd"],
        namaIcdIndo: json["nama_icd_indo"],
      );

  Map<String, dynamic> toJson() => {
        "kode_icd": kodeIcd,
        "nama_icd": namaIcd,
        "nama_icd_indo": namaIcdIndo,
      };
}
