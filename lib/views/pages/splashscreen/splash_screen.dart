part of '../../pages.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AppPreferences _preferences = AppPreferences();

  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    try {
      var getLogin = await _preferences.getLoginState();
      var getOnboarding = await _preferences.getOnboardingState();

      print('login : $getLogin onboarding: $getOnboarding');

      if (getLogin && getOnboarding) {
        var duration = const Duration(seconds: 3);
        return Timer(duration, () {
          Navigator.pushReplacementNamed(context, AppRoute.DASHBOARD);
        });
      } else if (getLogin || getOnboarding) {
        var duration = const Duration(seconds: 3);
        return Timer(duration, () {
          Navigator.pushReplacementNamed(context, AppRoute.LOGIN_ROUTE);
        });
      } else {
        var duration = const Duration(seconds: 3);
        return Timer(duration, () {
          Navigator.pushReplacementNamed(context, AppRoute.ONBOARDING);
        });
      }
    } catch (err) {
      var duration = const Duration(seconds: 3);
      return Timer(duration, () {
        Navigator.pushReplacementNamed(context, AppRoute.WRAPPER);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              // Lottie Icon
              child: Lottie.asset('assets/lottie/delivery-boy.json'),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Text(
              'Copyright Reodev. 2023',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
