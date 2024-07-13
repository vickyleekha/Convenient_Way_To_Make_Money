
import 'dart:convert';

List<Images> imageFromJson(dynamic str) => List<Images>.from(json.decode(str).map((x) => Images.fromJson(x)));

String imageToJson(List<Images> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Images {
    Images({
      required this.id,
        required this.images,
        required this.created,
        this.imageClass,
        this.ownerId,
        required this.updated,
        required this.objectId,
      required this.groupNo
    });

    int id;
    String images;
    int created;
   dynamic imageClass;
    dynamic ownerId;
    int updated;
    String objectId;
    String groupNo;


    factory Images.fromJson(Map<String, dynamic> json) => Images(
      id: json["id"],
        images: json["images"],
        created: json["created"],
        imageClass: json["___class"],
        ownerId: json["ownerId"],
        updated: json["updated"],
        objectId: json["objectId"],
      groupNo: json["group_no"],
    );

    Map<String, dynamic> toJson() => {
      "id": id,
        "images": images,
        "created": created,
        "___class": imageClass,
        "ownerId": ownerId,
        "updated": updated,
        "objectId": objectId,
      "group_no": groupNo,
    };
}








