part of '../../pages.dart';

class RegisterAkun extends StatefulWidget {
  const RegisterAkun({Key? key}) : super(key: key);

  @override
  _RegisterAkunState createState() => _RegisterAkunState();
}

class _RegisterAkunState extends State<RegisterAkun> {
  late FocusNode node;

  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  final TextEditingController _confPassword = new TextEditingController();

  bool showSatu = false;
  bool showDua = false;
  late Uint8List? _logoBytes = null;

  @override
  void initState() {
    super.initState();
    _initData();
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
        child: Scaffold(
          body: _body(context),
        ),
      ),
    );
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
                _logoBytes != null
                    ? Container(
                        width: 200,
                        alignment: Alignment.center,
                        child: Image(image: MemoryImage(_logoBytes!)),
                      )
                    : Container(
                        width: 200,
                        alignment: Alignment.center,
                        child: Image(
                            image: AssetImage(
                                '${AppConst.IMAGE_PATH}/juicy-ethereum-icon.png')),
                      ),
              ],
            ),
            Text(
              'Silahkan untuk membuat Akun Anda',
              textAlign: TextAlign.center,
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
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  )
                : Container(),
            Text(
              'Email Adress',
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Masukkan Email Anda",
                  prefixIcon: Icon(Icons.email)),
              controller: _email,
            ),
            Text(
              'Password',
            ),
            TextField(
              obscureText: !showSatu,
              decoration: InputDecoration(
                hintText: "Masukkan Password Anda",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon:
                      Icon(showSatu ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      showSatu = !showSatu;
                      ;
                    });
                  },
                ),
              ),
              controller: _password,
            ),
            Text('Konfirmasi Password'),
            TextField(
              obscureText: !showDua,
              decoration: InputDecoration(
                hintText: "Masukkan Password Anda",
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(showDua ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      showDua = !showDua;
                      ;
                    });
                  },
                ),
              ),
              controller: _confPassword,
            ),
            ElevatedButton(
              onPressed: () {
                if (_password.text != _confPassword.text) {
                  const snackBar = SnackBar(
                    content:
                        Text('Password tidak sama , harap periksa kembali'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {}
              },
              child: Text('Simpan'),
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
}
