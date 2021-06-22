import 'package:bloc_clean_framework/service/service.dart';

class CryptoDetailsResponse implements ResponseModel {
  CryptoDetailsResponse({
    this.status,
    this.data,
  });

  final Status status;
  final Data data;

  factory CryptoDetailsResponse.fromJson(
          Map<String, dynamic> json, String cryptoId) =>
      CryptoDetailsResponse(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        data:
            json["data"] == null ? null : Data.fromJson(json["data"], cryptoId),
      );
}

class Data {
  Data({
    this.the1,
    this.cryptoId,
  });

  final The1 the1;
  final String cryptoId;

  factory Data.fromJson(Map<String, dynamic> json, String cryptoId) => Data(
        the1: The1.fromJson(json["$cryptoId"]),
      );
}

class The1 {
  The1({
    this.id,
    this.name,
    this.symbol,
    this.category,
    this.description,
    this.slug,
    this.logo,
    this.subreddit,
    this.notice,
    this.tags,
    this.tagNames,
    this.tagGroups,
    this.urls,
    this.platform,
    this.dateAdded,
    this.twitterUsername,
    this.isHidden,
  });

  final int id;
  final String name;
  final String symbol;
  final String category;
  final String description;
  final String slug;
  final String logo;
  final String subreddit;
  final String notice;
  final List<String> tags;
  final List<String> tagNames;
  final List<TagGroup> tagGroups;
  final Urls urls;
  final dynamic platform;
  final DateTime dateAdded;
  final String twitterUsername;
  final int isHidden;

  factory The1.fromJson(Map<String, dynamic> json) => The1(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        symbol: json["symbol"] ?? '',
        category: json["category"] ?? '',
        description: json["description"] ?? '',
        slug: json["slug"] ?? '',
        logo: json["logo"] ?? '',
        subreddit: json["subreddit"] ?? '',
        notice: json["notice"] ?? '',
        tags: json["tags"] == null
            ? null
            : List<String>.from(json["tags"].map((x) => x)),
        tagNames: json["tag-names"] == null
            ? null
            : List<String>.from(json["tag-names"].map((x) => x)),
        tagGroups: json["tag-groups"] == null
            ? null
            : List<TagGroup>.from(
                json["tag-groups"].map((x) => tagGroupValues.map[x])),
        urls: json["tag-groups"] == null ? null : Urls.fromJson(json["urls"]),
        platform: json["platform"] ?? '',
        dateAdded: json["date_added"] == null
            ? null
            : DateTime.parse(json["date_added"]),
        twitterUsername: json["twitter_username"] ?? '',
        isHidden: json["is_hidden"] ?? '',
      );
}

enum TagGroup { OTHER, CONSENSUS_ALGORITHM, PROPERTY }

final tagGroupValues = EnumValues({
  "CONSENSUS_ALGORITHM": TagGroup.CONSENSUS_ALGORITHM,
  "OTHER": TagGroup.OTHER,
  "PROPERTY": TagGroup.PROPERTY
});

class Urls {
  Urls({
    this.website,
    this.twitter,
    this.messageBoard,
    this.chat,
    this.explorer,
    this.reddit,
    this.technicalDoc,
    this.sourceCode,
    this.announcement,
  });

  final List<String> website;
  final List<dynamic> twitter;
  final List<String> messageBoard;
  final List<dynamic> chat;
  final List<String> explorer;
  final List<String> reddit;
  final List<String> technicalDoc;
  final List<String> sourceCode;
  final List<dynamic> announcement;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        website: List<String>.from(json["website"].map((x) => x)),
        twitter: List<dynamic>.from(json["twitter"].map((x) => x)),
        messageBoard: List<String>.from(json["message_board"].map((x) => x)),
        chat: List<dynamic>.from(json["chat"].map((x) => x)),
        explorer: List<String>.from(json["explorer"].map((x) => x)),
        reddit: List<String>.from(json["reddit"].map((x) => x)),
        technicalDoc: List<String>.from(json["technical_doc"].map((x) => x)),
        sourceCode: List<String>.from(json["source_code"].map((x) => x)),
        announcement: List<dynamic>.from(json["announcement"].map((x) => x)),
      );
}

class Status {
  Status({
    this.timestamp,
    this.errorCode,
    this.errorMessage,
    this.elapsed,
    this.creditCount,
    this.notice,
  });

  final DateTime timestamp;
  final int errorCode;
  final dynamic errorMessage;
  final int elapsed;
  final int creditCount;
  final dynamic notice;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        timestamp: DateTime.parse(json["timestamp"]),
        errorCode: json["error_code"],
        errorMessage: json["error_message"],
        elapsed: json["elapsed"],
        creditCount: json["credit_count"],
        notice: json["notice"],
      );
}

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
