import 'dart:convert';

import 'package:toktik/domain/entities/video_post.dart';

class LocalVideoModel {
    String name;
    String videoUrl;
    int likes;
    int views;

    LocalVideoModel({
        required this.name,
        required this.videoUrl,
        this.likes = 0,
        this.views = 0,
    });

    factory LocalVideoModel.fromJson(String str) => LocalVideoModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LocalVideoModel.fromMap(Map<String, dynamic> json) => LocalVideoModel(
        name: json["name"],
        videoUrl: json["videoUrl"],
        likes: json["likes"] ?? 0,
        views: json["views"] ?? 0,
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "videoUrl": videoUrl,
        "likes": likes,
        "views": views,
    };

    VideoPost toVideoPostEntity() => VideoPost(
      caption: name,
      videoUrl: videoUrl,
      likes: likes,
      views: views
    );
}
