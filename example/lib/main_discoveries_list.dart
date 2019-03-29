// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

Future<List<Discoveries>> fetchListUser() async {
  final response =
      await http.get("http://api.lbb.in/discoveries");

  if (response.statusCode == 200) {
    print(response.body);
    final jsonData = json.decode(response.body);
    return new List<Discoveries>.from(
        jsonData.map((x) => Discoveries.fromJson(x)));
  } else {
    throw Exception("Failed to load users");
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Discoveries",
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: new Text("Discoveries"),
        ),
        body: Center(
          child: FutureBuilder<List<Discoveries>>(

            future: fetchListUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Discoveries> users = snapshot.data;
                //List<Section> section=snapshot.data;
                return new ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: users
                      .map((user) => Column(crossAxisAlignment: CrossAxisAlignment.stretch,children: <Widget>[

                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('Title : ${user.title}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('Cities : ${user.visibility.cities}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('What Makes It Awesome? : ${user.sections[0].content}'),
                        ),
                        /*Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('Cost? : ${user.sections[1].content}'),
                        ),*/

                        new Divider(
                          height: 16.0,
                          color: Colors.black26,
                        )

                  ],))
                      .toList(),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return new CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

/*List<User> userFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<User>.from(jsonData.map((x) => User.fromJson(x)));
}

String userToJson(List<User> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}*/

// To parse this JSON data, do
//
//     final discoveries = discoveriesFromJson(jsonString);


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
  Campaign campaign;
  BrandName brandName;
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
  String end;
  String start;
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
  List<dynamic> children;
  RecommendationType recommendationType;
  int v;
  Type structureType;

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
    this.structureType,
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
    campaign: campaignValues.map[json["campaign"]],
    brandName: brandNameValues.map[json["brandName"]],
    greatFor: new List<GreatFor>.from(json["greatFor"].map((x) => GreatFor.fromJson(x))),
    youtubeVideoId: json["youtubeVideoId"],
    publishDate: json["publish_date"],
    userLevel: json["userLevel"],
    meta: Meta.fromJson(json["meta"]),
    stats: Stats.fromJson(json["stats"]),
    buyableProducts: new List<dynamic>.from(json["buyable_products"].map((x) => x)),
    stickers: new List<String>.from(json["stickers"].map((x) => x)),
    tags: new List<String>.from(json["Tags"].map((x) => x)),
    places: new List<String>.from(json["places"].map((x) => x)),
    media: new List<String>.from(json["media"].map((x) => x)),
    end: json["end"] == null ? null : json["end"],
    start: json["start"] == null ? null : json["start"],
    visibility: Visibility.fromJson(json["visibility"]),
    sticky: json["sticky"],
    flag: flagValues.map[json["flag"]],
    curationStatus: json["curation_status"] == null ? null : json["curation_status"],
    publishStatus: publishStatusValues.map[json["publish_status"]],
    featured: json["featured"],
    archived: json["archived"],
    deleted: json["deleted"],
    curated: json["curated"],
    sections: new List<Section>.from(json["sections"].map((x) => Section.fromJson(x))),
    children: new List<dynamic>.from(json["children"].map((x) => x)),
    recommendationType: recommendationTypeValues.map[json["recommendation_type"]],
    v: json["__v"],
    structureType: json["structureType"] == null ? null : typeValues.map[json["structureType"]],
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
    "campaign": campaignValues.reverse[campaign],
    "brandName": brandNameValues.reverse[brandName],
    "greatFor": new List<dynamic>.from(greatFor.map((x) => x.toJson())),
    "youtubeVideoId": youtubeVideoId,
    "publish_date": publishDate,
    "userLevel": userLevel,
    "meta": meta.toJson(),
    "stats": stats.toJson(),
    "buyable_products": new List<dynamic>.from(buyableProducts.map((x) => x)),
    "stickers": new List<dynamic>.from(stickers.map((x) => x)),
    "Tags": new List<dynamic>.from(tags.map((x) => x)),
    "places": new List<dynamic>.from(places.map((x) => x)),
    "media": new List<dynamic>.from(media.map((x) => x)),
    "end": end == null ? null : end,
    "start": start == null ? null : start,
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
    "recommendation_type": recommendationTypeValues.reverse[recommendationType],
    "__v": v,
    "structureType": structureType == null ? null : typeValues.reverse[structureType],
  };
}

enum BrandName { EMPTY, WINEPROJECT }

final brandNameValues = new EnumValues({
  "": BrandName.EMPTY,
  "wineproject": BrandName.WINEPROJECT
});

enum Campaign { EMPTY, WINEPROJECTDELHIWINEFESTIVALFEB2019 }

final campaignValues = new EnumValues({
  "": Campaign.EMPTY,
  "wineprojectdelhiwinefestivalfeb2019": Campaign.WINEPROJECTDELHIWINEFESTIVALFEB2019
});

enum Flag { IN_PROGRESS }

final flagValues = new EnumValues({
  "In-progress": Flag.IN_PROGRESS
});

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
  dynamic relativeTimeDescription;
  dynamic eventSource;
  dynamic price;
  dynamic bookingLink;
  List<dynamic> stickersData;
  dynamic curationDate;
  String placeSource;
  List<dynamic> externalLinks;
  bool isBuyable;
  dynamic source;

  Meta({
    this.relativeTimeDescription,
    this.eventSource,
    this.price,
    this.bookingLink,
    this.stickersData,
    this.curationDate,
    this.placeSource,
    this.externalLinks,
    this.isBuyable,
    this.source,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => new Meta(
    relativeTimeDescription: json["relative_time_description"],
    eventSource: json["event_source"],
    price: json["price"],
    bookingLink: json["booking_link"],
    stickersData: new List<dynamic>.from(json["stickersData"].map((x) => x)),
    curationDate: json["curation_date"],
    placeSource: json["place_source"] == null ? null : json["place_source"],
    externalLinks: new List<dynamic>.from(json["external_links"].map((x) => x)),
    isBuyable: json["is_buyable"] == null ? null : json["is_buyable"],
    source: json["source"],
  );

  Map<String, dynamic> toJson() => {
    "relative_time_description": relativeTimeDescription,
    "event_source": eventSource,
    "price": price,
    "booking_link": bookingLink,
    "stickersData": new List<dynamic>.from(stickersData.map((x) => x)),
    "curation_date": curationDate,
    "place_source": placeSource == null ? null : placeSource,
    "external_links": new List<dynamic>.from(externalLinks.map((x) => x)),
    "is_buyable": isBuyable == null ? null : isBuyable,
    "source": source,
  };
}

enum Mode { ALL }

final modeValues = new EnumValues({
  "All": Mode.ALL
});

class More {
  String bookmark;
  String source;

  More({
    this.bookmark,
    this.source,
  });

  factory More.fromJson(Map<String, dynamic> json) => new More(
    bookmark: json["bookmark"] == null ? null : json["bookmark"],
    source: json["source"] == null ? null : json["source"],
  );

  Map<String, dynamic> toJson() => {
    "bookmark": bookmark == null ? null : bookmark,
    "source": source == null ? null : source,
  };
}

enum PublishStatus { PUBLISH }

final publishStatusValues = new EnumValues({
  "publish": PublishStatus.PUBLISH
});

enum RecommendationType { SINGLE }

final recommendationTypeValues = new EnumValues({
  "single": RecommendationType.SINGLE
});

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
  int recommendCount;
  int bookmarkCount;
  int commentCount;

  Stats({
    this.recommendCount,
    this.bookmarkCount,
    this.commentCount,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => new Stats(
    recommendCount: json["recommendCount"],
    bookmarkCount: json["bookmarkCount"],
    commentCount: json["commentCount"] == null ? null : json["commentCount"],
  );

  Map<String, dynamic> toJson() => {
    "recommendCount": recommendCount,
    "bookmarkCount": bookmarkCount,
    "commentCount": commentCount == null ? null : commentCount,
  };
}

enum Type { POST, ARTICLE }

final typeValues = new EnumValues({
  "Article": Type.ARTICLE,
  "Post": Type.POST
});

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
