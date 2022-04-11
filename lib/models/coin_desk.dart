// To parse this JSON data, do
//
//     final coinDeskModel = coinDeskModelFromJson(jsonString);

import 'dart:convert';

CoinDeskModel coinDeskModelFromJson(String str) =>
    CoinDeskModel.fromJson(json.decode(str));

String coinDeskModelToJson(CoinDeskModel data) => json.encode(data.toJson());

class CoinDeskModel {
  CoinDeskModel({
    required this.bpi,
    required this.disclaimer,
    required this.time,
  });

  Map<String, double> bpi;
  String disclaimer;
  Time time;

  factory CoinDeskModel.fromJson(Map<String, dynamic> json) => CoinDeskModel(
        bpi: Map.from(json["bpi"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        disclaimer: json["disclaimer"],
        time: Time.fromJson(json["time"]),
      );

  Map<String, dynamic> toJson() => {
        "bpi": Map.from(bpi).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "disclaimer": disclaimer,
        "time": time.toJson(),
      };
}

class Time {
  Time({
    required this.updated,
    required this.updatedIso,
  });

  String updated;
  DateTime updatedIso;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        updated: json["updated"],
        updatedIso: DateTime.parse(json["updatedISO"]),
      );

  Map<String, dynamic> toJson() => {
        "updated": updated,
        "updatedISO": updatedIso.toIso8601String(),
      };
}
