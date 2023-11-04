import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inova_coding_test/data/data_source/local_data_source/permanent_data_source/app_cache.dart';
import 'package:inova_coding_test/presentation/ui/home_page/view/home_page.dart';

class RoutesPath {
  static const splash = "/Splash";
  static const login = "/Login";
  static const home = "/Home";
  static const addNewTask = "/AddNewTask";
  static const doneTasks = "/DoneTasks";
}

class RoutesName {
  static const splash = "Splash";
  static const login = "Login";
  static const home = "Home";
  static const addNewTask = "AddNewTask";
  static const doneTasks = "DoneTasks";
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  final AppSharedPrefs _appPreferences;
  // final AppNavigationManagerImpl _appNavigationManager;
  AppRouter(this._appPreferences);

  // 4
  late final router = GoRouter(
    navigatorKey: navigatorKey,
    // 5
    debugLogDiagnostics: false,
    // 6
    // refreshListenable: _appNavigationManager,
    // 7
    initialLocation: RoutesPath.home,
    // 8
    routes: [
      //  Home Page
      GoRoute(
        name: RoutesName.home,
        path: RoutesPath.home,
        builder: (context, state) => const HomePage(),
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(
              state.error.toString(),
            ),
          ),
        ),
      );
    },
    redirect: (ctx, goRouterState) async {
      // final loggedIn = _appPreferences.getIsUserLoggedIn();

      // final loggingIn = goRouterState.location == RoutesPath.login;

      // if (!loggedIn) return loggingIn ? null : RoutesPath.login;

      // return null;
    },
  );
}
