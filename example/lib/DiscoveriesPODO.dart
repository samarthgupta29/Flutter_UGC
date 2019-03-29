// To parse this JSON data, do
//
//     final discoveries = discoveriesFromJson(jsonString);

import 'dart:convert';

List<Discoveries> discoveriesFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Discoveries>.from(
      jsonData.map((x) => Discoveries.fromJson(x)));
}

String discoveriesToJson(List<Discoveries> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Discoveries {
  String id;
  Mode mode;
  String source;
  String createdAt;
  More more;
  String user;
  String provider;
  String slug;
  String title;
  String updatedAt;
  String data;
  Type type;
  String campaign;
  String brandName;
  List<GreatFor> greatFor;
  String youtubeVideoId;
  String publishDate;
  int userLevel;
  Meta meta;
  Stats stats;
  List<dynamic> buyableProducts;
  List<String> stickers;
  List<String> tags;
  List<String> places;
  List<String> media;
  dynamic end;
  dynamic start;
  Visibility visibility;
  bool sticky;
  Flag flag;
  String curationStatus;
  PublishStatus publishStatus;
  bool featured;
  bool archived;
  bool deleted;
  bool curated;
  List<Section> sections;
  List<String> children;
  RecommendationType recommendationType;
  int v;
  dynamic buyProvider;
  String structureType;
  GreatFor parent;

  Discoveries({
    this.id,
    this.mode,
    this.source,
    this.createdAt,
    this.more,
    this.user,
    this.provider,
    this.slug,
    this.title,
    this.updatedAt,
    this.data,
    this.type,
    this.campaign,
    this.brandName,
    this.greatFor,
    this.youtubeVideoId,
    this.publishDate,
    this.userLevel,
    this.meta,
    this.stats,
    this.buyableProducts,
    this.stickers,
    this.tags,
    this.places,
    this.media,
    this.end,
    this.start,
    this.visibility,
    this.sticky,
    this.flag,
    this.curationStatus,
    this.publishStatus,
    this.featured,
    this.archived,
    this.deleted,
    this.curated,
    this.sections,
    this.children,
    this.recommendationType,
    this.v,
    this.buyProvider,
    this.structureType,
    this.parent,
  });

  factory Discoveries.fromJson(Map<String, dynamic> json) => new Discoveries(
        id: json["_id"],
        mode: modeValues.map[json["mode"]],
        source: json["source"] == null ? null : json["source"],
        createdAt: json["createdAt"],
        more: json["more"] == null ? null : More.fromJson(json["more"]),
        user: json["user"],
        provider: json["provider"],
        slug: json["slug"],
        title: json["title"],
        updatedAt: json["updatedAt"],
        data: json["data"] == null ? null : json["data"],
        type: typeValues.map[json["type"]],
        campaign: json["campaign"],
        brandName: json["brandName"],
        greatFor: new List<GreatFor>.from(
            json["greatFor"].map((x) => GreatFor.fromJson(x))),
        youtubeVideoId:
            json["youtubeVideoId"] == null ? null : json["youtubeVideoId"],
        publishDate: json["publish_date"],
        userLevel: json["userLevel"],
        meta: Meta.fromJson(json["meta"]),
        stats: Stats.fromJson(json["stats"]),
        buyableProducts:
            new List<dynamic>.from(json["buyable_products"].map((x) => x)),
        stickers: new List<String>.from(json["stickers"].map((x) => x)),
        tags: new List<String>.from(json["Tags"].map((x) => x)),
        places: new List<String>.from(json["places"].map((x) => x)),
        media: new List<String>.from(json["media"].map((x) => x)),
        end: json["end"],
        start: json["start"],
        visibility: Visibility.fromJson(json["visibility"]),
        sticky: json["sticky"],
        flag: flagValues.map[json["flag"]],
        curationStatus:
            json["curation_status"] == null ? null : json["curation_status"],
        publishStatus: publishStatusValues.map[json["publish_status"]],
        featured: json["featured"],
        archived: json["archived"],
        deleted: json["deleted"],
        curated: json["curated"],
        sections: new List<Section>.from(
            json["sections"].map((x) => Section.fromJson(x))),
        children: new List<String>.from(json["children"].map((x) => x)),
        recommendationType:
            recommendationTypeValues.map[json["recommendation_type"]],
        v: json["__v"],
        buyProvider: json["buy_provider"],
        structureType:
            json["structureType"] == null ? null : json["structureType"],
        parent:
            json["parent"] == null ? null : GreatFor.fromJson(json["parent"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "mode": modeValues.reverse[mode],
        "source": source == null ? null : source,
        "createdAt": createdAt,
        "more": more == null ? null : more.toJson(),
        "user": user,
        "provider": provider,
        "slug": slug,
        "title": title,
        "updatedAt": updatedAt,
        "data": data == null ? null : data,
        "type": typeValues.reverse[type],
        "campaign": campaign,
        "brandName": brandName,
        "greatFor": new List<dynamic>.from(greatFor.map((x) => x.toJson())),
        "youtubeVideoId": youtubeVideoId == null ? null : youtubeVideoId,
        "publish_date": publishDate,
        "userLevel": userLevel,
        "meta": meta.toJson(),
        "stats": stats.toJson(),
        "buyable_products":
            new List<dynamic>.from(buyableProducts.map((x) => x)),
        "stickers": new List<dynamic>.from(stickers.map((x) => x)),
        "Tags": new List<dynamic>.from(tags.map((x) => x)),
        "places": new List<dynamic>.from(places.map((x) => x)),
        "media": new List<dynamic>.from(media.map((x) => x)),
        "end": end,
        "start": start,
        "visibility": visibility.toJson(),
        "sticky": sticky,
        "flag": flagValues.reverse[flag],
        "curation_status": curationStatus == null ? null : curationStatus,
        "publish_status": publishStatusValues.reverse[publishStatus],
        "featured": featured,
        "archived": archived,
        "deleted": deleted,
        "curated": curated,
        "sections": new List<dynamic>.from(sections.map((x) => x.toJson())),
        "children": new List<dynamic>.from(children.map((x) => x)),
        "recommendation_type":
            recommendationTypeValues.reverse[recommendationType],
        "__v": v,
        "buy_provider": buyProvider,
        "structureType": structureType == null ? null : structureType,
        "parent": parent == null ? null : parent.toJson(),
      };
}

enum Flag { IN_PROGRESS }

final flagValues = new EnumValues({"In-progress": Flag.IN_PROGRESS});

class GreatFor {
  String title;
  String slug;
  String id;

  GreatFor({
    this.title,
    this.slug,
    this.id,
  });

  factory GreatFor.fromJson(Map<String, dynamic> json) => new GreatFor(
        title: json["title"],
        slug: json["slug"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "slug": slug,
        "_id": id,
      };
}

class Meta {
  String placeSource;
  dynamic curationDate;
  List<dynamic> stickersData;
  dynamic bookingLink;
  dynamic price;
  dynamic eventSource;
  dynamic relativeTimeDescription;
  List<dynamic> externalLinks;
  bool isBuyable;
  dynamic source;

  Meta({
    this.placeSource,
    this.curationDate,
    this.stickersData,
    this.bookingLink,
    this.price,
    this.eventSource,
    this.relativeTimeDescription,
    this.externalLinks,
    this.isBuyable,
    this.source,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => new Meta(
        placeSource: json["place_source"] == null ? null : json["place_source"],
        curationDate: json["curation_date"],
        stickersData:
            new List<dynamic>.from(json["stickersData"].map((x) => x)),
        bookingLink: json["booking_link"],
        price: json["price"],
        eventSource: json["event_source"],
        relativeTimeDescription: json["relative_time_description"],
        externalLinks:
            new List<dynamic>.from(json["external_links"].map((x) => x)),
        isBuyable: json["is_buyable"] == null ? null : json["is_buyable"],
        source: json["source"],
      );

  Map<String, dynamic> toJson() => {
        "place_source": placeSource == null ? null : placeSource,
        "curation_date": curationDate,
        "stickersData": new List<dynamic>.from(stickersData.map((x) => x)),
        "booking_link": bookingLink,
        "price": price,
        "event_source": eventSource,
        "relative_time_description": relativeTimeDescription,
        "external_links": new List<dynamic>.from(externalLinks.map((x) => x)),
        "is_buyable": isBuyable == null ? null : isBuyable,
        "source": source,
      };
}

enum Mode { ALL }

final modeValues = new EnumValues({"All": Mode.ALL});

class More {
  String source;
  String bookmark;

  More({
    this.source,
    this.bookmark,
  });

  factory More.fromJson(Map<String, dynamic> json) => new More(
        source: json["source"] == null ? null : json["source"],
        bookmark: json["bookmark"] == null ? null : json["bookmark"],
      );

  Map<String, dynamic> toJson() => {
        "source": source == null ? null : source,
        "bookmark": bookmark == null ? null : bookmark,
      };
}

enum PublishStatus { PUBLISH }

final publishStatusValues = new EnumValues({"publish": PublishStatus.PUBLISH});

enum RecommendationType { SINGLE, MULTI }

final recommendationTypeValues = new EnumValues(
    {"multi": RecommendationType.MULTI, "single": RecommendationType.SINGLE});

class Section {
  String id;
  List<dynamic> places;
  List<dynamic> media;
  String content;
  String title;
  int qid;

  Section({
    this.id,
    this.places,
    this.media,
    this.content,
    this.title,
    this.qid,
  });

  factory Section.fromJson(Map<String, dynamic> json) => new Section(
        id: json["_id"],
        places: new List<dynamic>.from(json["places"].map((x) => x)),
        media: new List<dynamic>.from(json["media"].map((x) => x)),
        content: json["content"],
        title: json["title"],
        qid: json["qid"] == null ? null : json["qid"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "places": new List<dynamic>.from(places.map((x) => x)),
        "media": new List<dynamic>.from(media.map((x) => x)),
        "content": content,
        "title": title,
        "qid": qid == null ? null : qid,
      };
}

class Stats {
  int bookmarkCount;
  int recommendCount;
  int commentCount;

  Stats({
    this.bookmarkCount,
    this.recommendCount,
    this.commentCount,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => new Stats(
        bookmarkCount: json["bookmarkCount"],
        recommendCount: json["recommendCount"],
        commentCount:
            json["commentCount"] == null ? null : json["commentCount"],
      );

  Map<String, dynamic> toJson() => {
        "bookmarkCount": bookmarkCount,
        "recommendCount": recommendCount,
        "commentCount": commentCount == null ? null : commentCount,
      };
}

enum Type { POST, ARTICLE }

final typeValues = new EnumValues({"Article": Type.ARTICLE, "Post": Type.POST});

class Visibility {
  List<String> cities;

  Visibility({
    this.cities,
  });

  factory Visibility.fromJson(Map<String, dynamic> json) => new Visibility(
        cities: new List<String>.from(json["cities"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "cities": new List<dynamic>.from(cities.map((x) => x)),
      };
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
