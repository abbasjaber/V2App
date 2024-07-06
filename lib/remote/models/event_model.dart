import 'package:v2/remote/models/user_model.dart';

class Event {
  String? sId;
  String? title;
  String? description;
  String? address;
  String? date;
  String? imageUrl;
  Location? location;
  String? owner;
  List<UserModel>? volunteers;
  String? category;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Event(
      {this.sId,
      this.title,
      this.description,
      this.address,
      this.date,
      this.imageUrl,
      this.location,
      this.owner,
      this.volunteers,
      this.category,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Event.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    address = json['address'];
    date = json['date'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    owner = json['owner'];
    if (json['volunteers'] != null) {
      volunteers = <UserModel>[];
      json['volunteers'].forEach((v) {
        volunteers!.add(UserModel.fromJson(v));
      });
    }
    category = json['category'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    imageUrl = "https://picsum.photos/200/100";
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['address'] = address;
    data['date'] = date;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['owner'] = owner;
    if (volunteers != null) {
      data['volunteers'] = volunteers!.map((v) => v.toJson()).toList();
    }
    data['category'] = category;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Location {
  String? lat;
  String? long;
  String? sId;

  Location({this.lat, this.long, this.sId});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['long'] = long;
    data['_id'] = sId;
    return data;
  }
}
