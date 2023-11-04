// ignore: must_be_immutable
import 'package:equatable/equatable.dart';

class TrainingSeries {
  SeriesData seriesData;
  List<CoachData> coaches;
  List<SeriesClassData> classesData;
  List<CommunityPost> communityPosts;
  TrainingSeries({
    required this.seriesData,
    required this.coaches,
    required this.classesData,
    required this.communityPosts,
  });
}

class SeriesClassData {
  String video;
  String title;
  String description;
  SeriesClassData({
    required this.video,
    required this.title,
    required this.description,
  });
}

class CommunityPost {
  String image;
  String title;
  DateTime postTime;
  SeriesClassData classData;
  String post;
  int numberOfLikes;
  CommunityPost({
    required this.image,
    required this.title,
    required this.postTime,
    required this.classData,
    required this.post,
    required this.numberOfLikes,
  });
}

class SeriesData {
  String coverPhoto;
  String seriesTitle;
  String description;
  String totalTime;
  String difficulty;
  String intensity;
  SeriesData({
    required this.coverPhoto,
    required this.description,
    required this.seriesTitle,
    required this.totalTime,
    required this.difficulty,
    required this.intensity,
  });
}

class CoachData {
  String coachName;
  String coachDescription;
  String coachPhoto;
  String coachVideo;
  CoachData({
    required this.coachName,
    required this.coachPhoto,
    required this.coachDescription,
    required this.coachVideo,
  });
}
