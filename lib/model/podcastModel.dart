// To parse this JSON data, do
//
//     final podcastModel = podcastModelFromJson(jsonString);

import 'dart:convert';

PodcastModel podcastModelFromJson(String str) => PodcastModel.fromJson(json.decode(str));

String podcastModelToJson(PodcastModel data) => json.encode(data.toJson());

class PodcastModel {
    PodcastModel({
        this.data,
        this.total,
        this.limit,
        this.start,
        this.page,
    });

    List<Datum> data;
    int total;
    int limit;
    int start;
    int page;

    factory PodcastModel.fromJson(Map<String, dynamic> json) => PodcastModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        total: json["total"],
        limit: json["limit"],
        start: json["start"],
        page: json["page"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "total": total,
        "limit": limit,
        "start": start,
        "page": page,
    };
}

class Datum {
    Datum({
        this.id,
        this.lang,
        this.title,
        this.source,
        this.audioUrl,
        this.imageUrl,
        this.summary,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.isFeatured,
    });

    String id;
    Lang lang;
    String title;
    String source;
    String audioUrl;
    String imageUrl;
    String summary;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    bool isFeatured;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        lang: langValues.map[json["lang"]],
        title: json["title"],
        source: json["source"],
        audioUrl: json["audio_url"],
        imageUrl: json["image_url"],
        summary: json["summary"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        v: json["__v"] == null ? null : json["__v"],
        isFeatured: json["is_featured"] == null ? null : json["is_featured"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "lang": langValues.reverse[lang],
        "title": title,
        "source": source,
        "audio_url": audioUrl,
        "image_url": imageUrl,
        "summary": summary,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
        "is_featured": isFeatured == null ? null : isFeatured,
    };
}

enum Lang { NP, EN }

final langValues = EnumValues({
    "en": Lang.EN,
    "np": Lang.NP
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
