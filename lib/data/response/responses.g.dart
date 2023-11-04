// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..status = json['status'] as int?
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

CoachDataResponse _$CoachDataResponseFromJson(Map<String, dynamic> json) =>
    CoachDataResponse(
      coachName: json['coachName'] as String?,
      coachPhoto: json['coachPhoto'] as String?,
      coachDescription: json['coachDescription'] as String?,
      coachVideo: json['coachVideo'] as String?,
    );

Map<String, dynamic> _$CoachDataResponseToJson(CoachDataResponse instance) =>
    <String, dynamic>{
      'coachName': instance.coachName,
      'coachDescription': instance.coachDescription,
      'coachPhoto': instance.coachPhoto,
      'coachVideo': instance.coachVideo,
    };

CommunityPostResponse _$CommunityPostResponseFromJson(
        Map<String, dynamic> json) =>
    CommunityPostResponse(
      image: json['image'] as String?,
      title: json['title'] as String?,
      postTime: json['postTime'] == null
          ? null
          : DateTime.parse(json['postTime'] as String),
      classData: json['classData'] == null
          ? null
          : SeriesClassDataResponse.fromJson(
              json['classData'] as Map<String, dynamic>),
      post: json['post'] as String?,
      numberOfLikes: json['numberOfLikes'] as int?,
    );

Map<String, dynamic> _$CommunityPostResponseToJson(
        CommunityPostResponse instance) =>
    <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'postTime': instance.postTime?.toIso8601String(),
      'classData': instance.classData,
      'post': instance.post,
      'numberOfLikes': instance.numberOfLikes,
    };

SeriesDataResponse _$SeriesDataResponseFromJson(Map<String, dynamic> json) =>
    SeriesDataResponse(
      json['coverPhoto'] as String?,
      json['seriesTitle'] as String?,
      json['description'] as String?,
      json['totalTime'] as String?,
      json['difficulty'] as String?,
      json['intensity'] as String?,
    );

Map<String, dynamic> _$SeriesDataResponseToJson(SeriesDataResponse instance) =>
    <String, dynamic>{
      'coverPhoto': instance.coverPhoto,
      'seriesTitle': instance.seriesTitle,
      'description': instance.description,
      'totalTime': instance.totalTime,
      'difficulty': instance.difficulty,
      'intensity': instance.intensity,
    };

SeriesClassDataResponse _$SeriesClassDataResponseFromJson(
        Map<String, dynamic> json) =>
    SeriesClassDataResponse(
      video: json['video'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$SeriesClassDataResponseToJson(
        SeriesClassDataResponse instance) =>
    <String, dynamic>{
      'video': instance.video,
      'title': instance.title,
      'description': instance.description,
    };

TrainingSeriesResponse _$TrainingSeriesResponseFromJson(
        Map<String, dynamic> json) =>
    TrainingSeriesResponse(
      seriesData: json['seriesData'] == null
          ? null
          : SeriesDataResponse.fromJson(
              json['seriesData'] as Map<String, dynamic>),
      coaches: (json['coaches'] as List<dynamic>?)
          ?.map((e) => CoachDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      classesData: (json['classesData'] as List<dynamic>?)
          ?.map((e) =>
              SeriesClassDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      communityPosts: (json['communityPosts'] as List<dynamic>?)
          ?.map(
              (e) => CommunityPostResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrainingSeriesResponseToJson(
        TrainingSeriesResponse instance) =>
    <String, dynamic>{
      'seriesData': instance.seriesData,
      'coaches': instance.coaches,
      'classesData': instance.classesData,
      'communityPosts': instance.communityPosts,
    };
