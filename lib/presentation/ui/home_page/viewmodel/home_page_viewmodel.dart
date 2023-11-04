import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inova_coding_test/app/di.dart';
import 'package:inova_coding_test/domain/usecase/usecase.dart';
import 'package:inova_coding_test/presentation/ui/common/base_viewmodel/base_viewmodel.dart';
import 'package:inova_coding_test/presentation/ui/common/state_renderer/state_renderer.dart';
import 'package:inova_coding_test/presentation/ui/common/state_renderer/state_renderer_impl.dart';
import 'package:inova_coding_test/presentation/ui/common/ui_models/ui_models.dart';

class HomePageViewModel extends BaseViewModel
    with ChangeNotifier
    implements _HomePageViewModelInputs, _HomePageViewModelOutputs {
  late TrainingSeries trainingSeries;
  Completer<void> _completer = Completer<void>();

  @override
  void destroy() {}

  @override
  void start() {
    _completer = Completer<void>();
    // final coaches = [
    //   CoachData(
    //     coachName: "Josh Kramer",
    //     coachPhoto:
    //         " https://img.freepik.com/premium-photo/smiling-man-practice-room_741371-51.jpg",
    //     coachDescription:
    //         "Josh Kramer is a certified fitness coach with 2 of experience in the fitness industry. With a focus on personalized training and holistic wellness, he has helped countless individuals achieve their fitness goals. Josh Kramer believes in a balanced approach to fitness, incorporating strength training, cardiovascular exercises, and flexibility routines to create well-rounded workout programs tailored to individual needs.",
    //     coachVideo: "https://youtu.be/YqFPuxCq0g4?si=mrtB-HU43861RETA",
    //   ),
    // ];
    // final classes = [
    //   SeriesClassData(
    //     video: "https://youtu.be/7LtXAhpSPmg?si=t-c6PUI-OWqFhbtb",
    //     title: "Day one",
    //     description: "We will in day one will just warm up.",
    //   ),
    // ];
    // final communityPosts = [
    //   CommunityPost(
    //     image:
    //         "https://media.istockphoto.com/id/675179390/photo/muscular-trainer-writing-on-clipboard.jpg?s=612x612&w=0&k=20&c=9NKx1AwVMpPY0YBlk5H-hxx2vJSCu1Wc78BKRM9wFq0=",
    //     title: "Great one",
    //     postTime: DateTime.now(),
    //     classData: classes.first,
    //     post: "Great one",
    //     numberOfLikes: 2,
    //   ),
    // ];
    // final seriesData = SeriesData(
    //   coverPhoto:
    //       "https://blog.nasm.org/hubfs/how-much-does-personal-trainer-cost.jpg",
    //   description:
    //       "In our dynamic training class, you'll experience a fusion of high-intensity workouts, expert guidance, and unwavering support. Led by certified fitness instructors with years of experience, the class focuses on a variety of exercises tailored to improve cardiovascular endurance, enhance strength, boost flexibility, and sculpt your body. Whether you're a beginner or an experienced fitness enthusiast, our class is structured to challenge and inspire you to reach new heights.",
    //   seriesTitle: "THE CHALLENGE",
    //   totalTime: "2 Hours",
    //   difficulty: "difficulty",
    //   intensity: "intensity",
    // );
    // trainingSeries = TrainingSeries(
    //   seriesData: seriesData,
    //   coaches: coaches,
    //   classesData: classes,
    //   communityPosts: communityPosts,
    // );
  }

  @override
  String get getTitle => " ";

  @override
  Future<void> getTrainingSeries(BuildContext ctx) async {
    _completer = Completer<void>();
    _getTrainingSeries(ctx);
    return _completer.future;
  }

  Future<void> _getTrainingSeries(BuildContext ctx) async {
    (await DI.getItInstance<GetTrainingSeriesUseCase>().execute(null)).fold(
        (left) {
      ErrorState(
              stateRendererType: StateRendererType.popupErrorState,
              message: left.message)
          .showPopup(ctx, StateRendererType.popupErrorState, left.message);
      _completer.completeError(left);
    }, (right) {
      trainingSeries = right;
      _completer.complete();
    });
  }

  @override
  void startPracticing() {}
}

abstract class _HomePageViewModelInputs {
  void startPracticing();
  Future<void> getTrainingSeries(BuildContext ctx);
}

abstract class _HomePageViewModelOutputs {
  String get getTitle;
}
