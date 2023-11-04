import 'package:flutter/material.dart';
import 'package:inova_coding_test/presentation/resources/color_manager.dart';
import 'package:inova_coding_test/presentation/resources/styles_manager.dart';
import 'package:inova_coding_test/presentation/resources/values_manager.dart';
import 'package:provider/provider.dart';
import 'package:inova_coding_test/presentation/ui/home_page/viewmodel/home_page_viewmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageViewModel>(
      create: (context) => HomePageViewModel(),
      builder: ((context, child) {
        return const _HomePageContent();
      }),
    );
  }
}

class _HomePageContent extends StatefulWidget {
  const _HomePageContent();

  @override
  State<_HomePageContent> createState() => __HomePageContentState();
}

class __HomePageContentState extends State<_HomePageContent> {
  late final HomePageViewModel _viewModel;
  double screenWidth = 0;

  @override
  void initState() {
    super.initState();
    _viewModel = Provider.of<HomePageViewModel>(context, listen: false);
    _viewModel.start();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.white,
        body: _body,
      ),
    );
  }

  Widget get _body => FutureBuilder(
        future: _viewModel.getTrainingSeries(context),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              {
                if (snapshot.hasError) {
                  return _getErrorWidget;
                } else {
                  return _getContent;
                }
              }
            default:
              return _getCircularProgressIndicator;
          }
        },
      );

  Widget get _getCircularProgressIndicator =>
      const Center(child: CircularProgressIndicator());

  Widget get _getErrorWidget => Center(
      child: Text("Some thing goes wrong. Please try again later",
          style: getBoldStyle(
            fontSize: AppSizeConstants.s20,
            fontFamily: AppFontFamily.lato,
            color: ColorConstants.error,
          )));
  Widget get _getContent => ListView(
        children: [
          Column(
            children: [
              getCoverImage,
              getTitle,
              getCoachName,
              getStartPracticeButton,
              DefaultTabController(
                length: 3,
                initialIndex: 0,
                child: Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      height: 80,
                      child: TabBar(
                        labelColor: ColorConstants.black,
                        tabs: <Widget>[
                          Tab(
                            text: 'OVERVIEW',
                          ),
                          Tab(text: 'CLASSES'),
                          Tab(text: 'COMMUNITY'),
                        ],
                      ),
                    ),
                    ListView(
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        SizedBox(
                          height: 800,
                          child: TabBarView(
                            children: <Widget>[
                              getOverView,
                              Container(),
                              Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );

  Widget get getOverView => Container(
        margin: const EdgeInsets.symmetric(vertical: AppMarginConstants.m14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: AppMarginConstants.m14),
              child: Text(
                "ABOUT THE SERIES",
                style: getSemiBoldStyle(
                  fontSize: AppSizeConstants.s18,
                  fontFamily: AppFontFamily.lato,
                  color: ColorConstants.black,
                ),
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: AppMarginConstants.m14),
              child: Text(
                _viewModel.trainingSeries.seriesData.description,
                style: getRegularStyle(
                  fontSize: AppSizeConstants.s14,
                  fontFamily: AppFontFamily.lato,
                  color: ColorConstants.black,
                ),
              ),
            ),
          ],
        ),
      );
  Widget get getTitle => Text(
        _viewModel.trainingSeries.seriesData.seriesTitle,
        style: getBlackStyle(
          fontSize: AppSizeConstants.s28,
          fontFamily: AppFontFamily.lato,
          color: ColorConstants.black,
        ),
      );
  Widget get getCoachName => Text(
        _viewModel.trainingSeries.coaches.isNotEmpty
            ? _viewModel.trainingSeries.coaches.first.coachName
            : "",
        style: getLightStyle(
          fontSize: AppSizeConstants.s20,
          fontFamily: AppFontFamily.lato,
          color: ColorConstants.black,
        ),
      );
  Widget get getCoverImage => Image.network(
        _viewModel.trainingSeries.seriesData.coverPhoto,
        width: double.infinity,
        height: AppSizeConstants.s320,
        fit: BoxFit.cover,
      );
  Widget get getStartPracticeButton => ElevatedButton(
        onPressed: _viewModel.startPracticing,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              ColorConstants.black, // Background color of the button
          foregroundColor: ColorConstants.white, // Text color of the button
          textStyle: const TextStyle(
              fontWeight: FontWeight.bold), // Text style of the button
        ),
        child: const Text('START PRACTICING'), // Text on the button
      );
}
