import 'package:inova_coding_test/app/constants/global_constants.dart';
import 'package:inova_coding_test/data/response/responses.dart';
import 'package:inova_coding_test/presentation/ui/common/ui_models/ui_models.dart';
import 'package:inova_coding_test/app/extensions.dart';

extension TrainingSeriesResponseMapper on TrainingSeriesResponse {
  TrainingSeries get toDomain {
    return TrainingSeries(
        seriesData: SeriesData(
            coverPhoto:
                seriesData?.coverPhoto.orEmpty.orEmpty ?? Constants.empty,
            description: seriesData?.description.orEmpty ?? Constants.empty,
            seriesTitle: seriesData?.seriesTitle.orEmpty ?? Constants.empty,
            totalTime: seriesData?.totalTime.orEmpty ?? Constants.empty,
            difficulty: seriesData?.difficulty.orEmpty ?? Constants.empty,
            intensity: seriesData?.intensity.orEmpty ?? Constants.empty),
        coaches: coaches?.map((e) => e.toDomain).toList() ?? [],
        classesData: classesData?.map((e) => e.toDomain).toList() ?? [],
        communityPosts: communityPosts?.map((e) => e.toDomain).toList() ?? []);
  }
}

extension on CoachDataResponse {
  CoachData get toDomain {
    return CoachData(
        coachName: coachName.orEmpty,
        coachPhoto: coachPhoto.orEmpty,
        coachDescription: coachDescription.orEmpty,
        coachVideo: coachVideo.orEmpty);
  }
}

extension on SeriesClassDataResponse {
  SeriesClassData get toDomain {
    return SeriesClassData(
        video: video.orEmpty,
        title: title.orEmpty,
        description: description.orEmpty);
  }
}

extension on CommunityPostResponse {
  CommunityPost get toDomain {
    return CommunityPost(
      image: image.orEmpty,
      title: title.orEmpty,
      postTime: postTime ?? DateTime.now(),
      classData: classData!.toDomain,
      post: post.orEmpty,
      numberOfLikes: numberOfLikes.orMinusOne,
    );
  }
}
