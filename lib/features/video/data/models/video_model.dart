class VideoModel {
  int? id;
  int? roomId;
  String? videoUrl;
  String? preview;
  String? size;
  String? duration;
  int? likeCount;
  String? likeCountTranslated;
  bool? authLikeStatus;

  VideoModel({
    this.id,
    this.roomId,
    this.videoUrl,
    this.preview,
    this.size,
    this.duration,
    this.likeCount,
    this.likeCountTranslated,
    this.authLikeStatus,
  });
  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        id: json["id"],
        roomId: json["room_id"],
        videoUrl: json["video"],
        preview: json["preview"],
        size: json["size"],
        duration: json["duration"],
        likeCount: json["likes_count"],
        likeCountTranslated: json["likes_count_translated"],
        authLikeStatus: json["auth_like_status"],
      );  
}
