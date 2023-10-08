part of '../../pages.dart';

class LoginPage extends StatefulWidget {
  final String? alert;

  const LoginPage({Key? key, this.alert}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final AppPreferences _preferences = AppPreferences();

  late FocusNode node;

  late String token = '';
  late String tipeUser = '';

  bool _isPassVisible = false;
  bool _isSuccess = true;

  String? _alertText;

  @override
  void initState() {
    _initData();
    super.initState();
  }

  void _initData() async {}

  @override
  Widget build(BuildContext context) {
    node = FocusScope.of(context);
    return Container(
      color: Colors.white,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(body: _body(context)),
      ),
    );
  }

  Widget _body(context) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(mainPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  '${AppConst.IMAGE_PATH}/juicy-ethereum-icon.png',
                  width: 200,
                  height: 200,
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'Login',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            _alertWidget(context),
            Text(
              'Email',
              style: TextStyle(fontSize: 14),
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
              ),
              textInputAction: TextInputAction.next,
              controller: _email,
              onEditingComplete: () => node.nextFocus(),
            ),
            Text(
              'Password',
              style: TextStyle(fontSize: 14),
            ),
            TextField(
              obscureText: !_isPassVisible,
              decoration: InputDecoration(
                hintText: "Masukkan Password Anda",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                      _isPassVisible ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isPassVisible = !_isPassVisible;
                    });
                  },
                ),
              ),
              controller: _password,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoute.FORGOT_PASSWORD);
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  fontSize: 14,
                  color: mainColor,
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _preferences.setLoginState(true);
                Navigator.pushNamed(context, AppRoute.DASHBOARD);
              },
              child: Text('Masuk'),
              style: ElevatedButton.styleFrom(
                primary: mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(buttonRoundedRadius),
                ),
              ),
            ),
            Text(
              'Apakah akun Anda belum diaktivasi?',
              style: TextStyle(fontSize: 13),
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoute.AKTIVASI_AKUN);
              },
              child: Text(
                'Aktivasi Sekarang',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'Belum memiliki akun?',
              style: TextStyle(fontSize: 13),
              textAlign: TextAlign.center,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoute.REGISTER_AKUN);
              },
              child: Text(
                'Register Sekarang',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              '${AppConst.COPYRIGHT}',
              style: TextStyle(fontSize: 11),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _alertWidget(context) {
    if (widget.alert != null && _alertText == null) {
      return Container(
        margin: EdgeInsets.only(bottom: 18),
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _isSuccess
              ? Colors.green.withOpacity(.3)
              : Colors.red.withOpacity(.3),
        ),
        child: Text(
          widget.alert!,
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
      );
    } else if (_alertText != null) {
      return Container(
        margin: EdgeInsets.only(bottom: 18),
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _isSuccess
              ? Colors.green.withOpacity(.3)
              : Colors.red.withOpacity(.3),
        ),
        child: Text(
          _alertText!,
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
      );
    } else {
      return Container();
    }
  }
}
