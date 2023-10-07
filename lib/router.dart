import 'package:dicoding_beginner/views/pages.dart';
import 'package:dicoding_beginner/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:dicoding_beginner/utils/app_constants.dart' as AppConst;
import 'package:dicoding_beginner/utils/app_routes.dart' as AppRoute;

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    /**
     * Initialize Data, make sure to have arguments and page transition.
     *
     * Penggunaan RouteSettings menyesuaikan sesuai kebutuhan
     * */
    final data = settings.arguments != null
        ? settings.arguments as Map<String, Object?>
        : null;
    // final PageTransitionAnimation pageTransitionAnimation = data != null
    //     ? data[AppConst.ARGS_PAGE_TRANSITION] != null
    //         ? data[AppConst.ARGS_PAGE_TRANSITION] as PageTransitionAnimation
    //         : PageTransitionAnimation.cupertino
    //     : PageTransitionAnimation.cupertino;
    final RouteSettings? routeSettings = data != null
        ? data[AppConst.ARGS_ROUTE_SETTINGS] != null
            ? data[AppConst.ARGS_ROUTE_SETTINGS] as RouteSettings
            : null
        : null;

    // switch case page

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case AppRoute.WRAPPER:
        return MaterialPageRoute(builder: (_) => Wrapper());
      case AppRoute.LOGIN_ROUTE:
        String? alert;
        return MaterialPageRoute(builder: (_) => LoginPage());
      case AppRoute.ONBOARDING:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
