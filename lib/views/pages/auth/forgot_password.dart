part of '../../pages.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  int? _groupValue = 0;
  bool _isDialogShowing = false;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _noHp = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initData();
  }

  void _initData() async {}

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          body: _body(context),
        ),
      ),
    );
  }

  void _closeDialog() {
    _isDialogShowing = !_isDialogShowing;
    Navigator.pop(context);
  }

  Widget _body(context, [String? alertText, bool isSuccess = true]) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(mainPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
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
              'Lupa Password',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            alertText != null
                ? Container(
                    margin: EdgeInsets.only(bottom: 18),
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isSuccess
                            ? Colors.green.withOpacity(.3)
                            : Colors.red.withOpacity(.3)),
                    child: Text(
                      alertText,
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  )
                : Container(),
            _selectorVerification(),
            ElevatedButton(
              onPressed: () {},
              child: Text('Kirim'),
              style: ElevatedButton.styleFrom(
                primary: mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(buttonRoundedRadius),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                'Login Kembali',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: mainColor,
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectorVerification() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              height: 32,
              width: 32,
              child: Radio(
                value: 0,
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value as int?;
                  });
                },
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            Text('Email'),
          ],
        ),
        TextField(
          decoration: InputDecoration(
            hintText: 'Masukkan Email',
            prefixIcon: Icon(Icons.email),
          ),
          style: TextStyle(fontSize: 13),
          enabled: _groupValue == 0 ? true : false,
          controller: _email,
        ),
        Row(
          children: [
            SizedBox(
              height: 32,
              width: 32,
              child: Radio(
                value: 1,
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value as int?;
                  });
                },
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            Text('Nomor Telepon'),
          ],
        ),
        TextField(
          decoration: InputDecoration(
            hintText: 'Masukkan Nomor Telepon',
            prefixIcon: Icon(Icons.phone),
          ),
          style: TextStyle(fontSize: 13),
          enabled: _groupValue == 1 ? true : false,
          controller: _noHp,
        ),
      ],
    );
  }
}
