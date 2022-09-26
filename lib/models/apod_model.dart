import 'dart:convert';

class ApodModel {
  ApodModel({
    this.copyright,
    required this.date,
    required this.explanation,
    this.hdurl,
    required this.mediaType,
    required this.serviceVersion,
    required this.title,
    this.thumbnailUrl,
    required this.url,
  });

  final String? copyright;
  final String date;
  final String explanation;
  final String? hdurl;
  final String mediaType;
  final String serviceVersion;
  final String title;
  final String? thumbnailUrl;
  final String url;

  factory ApodModel.fromJson(String str) => ApodModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ApodModel.fromMap(Map<String, dynamic> json) => ApodModel(
        copyright: json["copyright"],
        date: json["date"],
        explanation: json["explanation"],
        hdurl: json["hdurl"],
        mediaType: json["media_type"],
        serviceVersion: json["service_version"],
        title: json["title"],
        thumbnailUrl: json["thumbnail_url"] ?? '',
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "copyright": copyright,
        "date": date,
        "explanation": explanation,
        "hdurl": hdurl,
        "media_type": mediaType,
        "service_version": serviceVersion,
        "title": title,
        "thumbnail_url": thumbnailUrl,
        "url": url,
      };
}
