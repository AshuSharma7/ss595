// To parse this JSON data, do
//
//     final getTleResponseModel = getTleResponseModelFromJson(jsonString);

import 'dart:convert';

GetTleResponseModel getTleResponseModelFromJson(String str) =>
    GetTleResponseModel.fromJson(json.decode(str));

String getTleResponseModelToJson(GetTleResponseModel data) =>
    json.encode(data.toJson());

class GetTleResponseModel {
  GetTleResponseModel({
    this.context,
    this.id,
    this.type,
    this.totalItems,
    this.member,
    this.parameters,
    this.view,
  });

  String? context;
  String? id;
  String? type;
  int? totalItems;
  List<Member>? member;
  Parameters? parameters;
  View? view;

  factory GetTleResponseModel.fromJson(Map<String, dynamic> json) =>
      GetTleResponseModel(
        context: json["@context"] ?? null,
        id: json["@id"] ?? null,
        type: json["@type"] ?? null,
        totalItems: json["totalItems"] ?? null,
        member: json["member"] == null
            ? null
            : List<Member>.from(json["member"].map((x) => Member.fromJson(x))),
        parameters: json["parameters"] == null
            ? null
            : Parameters.fromJson(json["parameters"]),
        view: json["view"] == null ? null : View.fromJson(json["view"]),
      );

  Map<String, dynamic> toJson() => {
        "@context": context ?? null,
        "@id": id ?? null,
        "@type": type ?? null,
        "totalItems": totalItems ?? null,
        "member": member == null
            ? null
            : List<dynamic>.from(member!.map((x) => x.toJson())),
        "parameters": parameters == null ? null : parameters!.toJson(),
        "view": view == null ? null : view!.toJson(),
      };
}

class Member {
  Member({
    this.id,
    this.type,
    this.satelliteId,
    this.name,
    this.date,
    this.line1,
    this.line2,
  });

  String? id;
  String? type;
  int? satelliteId;
  String? name;
  DateTime? date;
  String? line1;
  String? line2;

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["@id"] ?? null,
        type: json["@type"] ?? null,
        satelliteId: json["satelliteId"] ?? null,
        name: json["name"] ?? null,
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        line1: json["line1"] ?? null,
        line2: json["line2"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "@id": id ?? null,
        "@type": type ?? null,
        "satelliteId": satelliteId ?? null,
        "name": name ?? null,
        "date": date == null ? null : date!.toIso8601String(),
        "line1": line1 ?? null,
        "line2": line2 ?? null,
      };
}

class Parameters {
  Parameters({
    this.search,
    this.sort,
    this.sortDir,
    this.page,
    this.pageSize,
  });

  String? search;
  String? sort;
  String? sortDir;
  int? page;
  int? pageSize;

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        search: json["search"] ?? null,
        sort: json["sort"] ?? null,
        sortDir: json["sort-dir"] ?? null,
        page: json["page"] ?? null,
        pageSize: json["page-size"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "search": search ?? null,
        "sort": sort ?? null,
        "sort-dir": sortDir ?? null,
        "page": page ?? null,
        "page-size": pageSize ?? null,
      };
}

class View {
  View({
    this.id,
    this.type,
    this.first,
    this.next,
    this.last,
  });

  String? id;
  String? type;
  String? first;
  String? next;
  String? last;

  factory View.fromJson(Map<String, dynamic> json) => View(
        id: json["@id"] ?? null,
        type: json["@type"] ?? null,
        first: json["first"] ?? null,
        next: json["next"] ?? null,
        last: json["last"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "@id": id ?? null,
        "@type": type ?? null,
        "first": first ?? null,
        "next": next ?? null,
        "last": last ?? null,
      };
}
