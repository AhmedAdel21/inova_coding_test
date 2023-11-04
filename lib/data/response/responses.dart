// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CoachDataResponse {
  @JsonKey(name: "coachName")
  String? coachName;
  @JsonKey(name: "coachDescription")
  String? coachDescription;
  @JsonKey(name: "coachPhoto")
  String? coachPhoto;
  @JsonKey(name: "coachVideo")
  String? coachVideo;

  CoachDataResponse({
    required this.coachName,
    required this.coachPhoto,
    required this.coachDescription,
    required this.coachVideo,
  });

  // from json
  factory CoachDataResponse.fromJson(Map<String, dynamic> json) =>
      _$CoachDataResponseFromJson(json);
  // to json

  Map<String, dynamic> toJson() => _$CoachDataResponseToJson(this);
}

@JsonSerializable()
class CommunityPostResponse {
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "postTime")
  DateTime? postTime;
  @JsonKey(name: "classData")
  SeriesClassDataResponse? classData;
  @JsonKey(name: "post")
  String? post;
  @JsonKey(name: "numberOfLikes")
  int? numberOfLikes;

  CommunityPostResponse({
    required this.image,
    required this.title,
    required this.postTime,
    required this.classData,
    required this.post,
    required this.numberOfLikes,
  });
  // from json
  factory CommunityPostResponse.fromJson(Map<String, dynamic> json) =>
      _$CommunityPostResponseFromJson(json);
  // to json

  Map<String, dynamic> toJson() => _$CommunityPostResponseToJson(this);
}

@JsonSerializable()
class SeriesDataResponse {
  @JsonKey(name: "coverPhoto")
  String? coverPhoto;
  @JsonKey(name: "seriesTitle")
  String? seriesTitle;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "totalTime")
  String? totalTime;
  @JsonKey(name: "difficulty")
  String? difficulty;
  @JsonKey(name: "intensity")
  String? intensity;

  SeriesDataResponse(
    this.coverPhoto,
    this.seriesTitle,
    this.description,
    this.totalTime,
    this.difficulty,
    this.intensity,
  );

  // from json
  factory SeriesDataResponse.fromJson(Map<String, dynamic> json) =>
      _$SeriesDataResponseFromJson(json);
  // to json

  Map<String, dynamic> toJson() => _$SeriesDataResponseToJson(this);
}

@JsonSerializable()
class SeriesClassDataResponse {
  @JsonKey(name: "video")
  String? video;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;

  SeriesClassDataResponse({
    required this.video,
    required this.title,
    required this.description,
  });

  // from json
  factory SeriesClassDataResponse.fromJson(Map<String, dynamic> json) =>
      _$SeriesClassDataResponseFromJson(json);
  // to json

  Map<String, dynamic> toJson() => _$SeriesClassDataResponseToJson(this);
}

@JsonSerializable()
class TrainingSeriesResponse {
  @JsonKey(name: "seriesData")
  SeriesDataResponse? seriesData;
  @JsonKey(name: "coaches")
  List<CoachDataResponse>? coaches;
  @JsonKey(name: "classesData")
  List<SeriesClassDataResponse>? classesData;
  @JsonKey(name: "communityPosts")
  List<CommunityPostResponse>? communityPosts;
  TrainingSeriesResponse({
    required this.seriesData,
    required this.coaches,
    required this.classesData,
    required this.communityPosts,
  });
  // from json
  factory TrainingSeriesResponse.fromJson(Map<String, dynamic> json) =>
      _$TrainingSeriesResponseFromJson(json);
  // to json

  Map<String, dynamic> toJson() => _$TrainingSeriesResponseToJson(this);
}
