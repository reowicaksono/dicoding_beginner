part of '../../pages.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<String> _imagePaths = [
    "assets/images/isometric-picnic-basket.png",
    "assets/images/isometric-picnic-basket.png",
    "assets/images/isometric-picnic-basket.png",
  ];

  List<String> _descriptions = [
    "Deskripsi Onboarding 1",
    "Deskripsi Onboarding 2",
    "Deskripsi Onboarding 3",
  ];
  final AppPreferences _pref = AppPreferences();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _imagePaths.length,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                return _onBoardingPage(
                  imagePath: _imagePaths[index],
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                if (_currentPage < _imagePaths.length - 1) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                } else {
                  _pref.setOnboardingState(true);
                  Navigator.pushReplacementNamed(context, AppRoute.LOGIN_ROUTE);
                }
              },
              child: Text(_currentPage < _imagePaths.length - 1
                  ? "Next"
                  : "Get Started"),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _onBoardingPage({context, imagePath}) {
  return Container(
    color: Colors.orange,
    child: Image.asset(
      imagePath,
      height: 200,
      width: 200,
      fit: BoxFit.contain,
    ),
  );
}
