import 'package:dicoding_beginner/router.dart';
import 'package:dicoding_beginner/utils/app_styles.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}
//Pakai ini hanyak saat mode development, jika sudah mode release harap kontak developer web!!!!
// HttpOverrides.global = MyHttpOverrides();

// void initFirebase() async {
//   await Firebase.initializeApp(
//       name: 'Dicoding Beginner',
//       options: const FirebaseOptions(
//           appId: 'your appid',
//           apiKey: 'your api key',
//           projectId: 'dicoding beginner',
//           messagingSenderId: 'your messangerid',
//       )
//   );
// }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beginner Dicoding',
      supportedLocales: [
        const Locale('id'),
        const Locale('en'),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          cardTheme: CardTheme(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(mainBorderRadius))),
          fontFamily: 'Nunito',
          appBarTheme: AppBarTheme(
            backgroundColor: mainColor,
            centerTitle: true,
            elevation: 2,
          ),
          primarySwatch: primarySwatch,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(onSurface: Colors.grey[850])),
          sliderTheme: SliderThemeData(),
          scaffoldBackgroundColor: backgroundGrey,
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: mainColor),
          tabBarTheme: TabBarTheme(
              labelPadding: EdgeInsets.symmetric(horizontal: 20),
              labelColor: mainColor,
              labelStyle:
                  TextStyle(color: mainColor, fontWeight: FontWeight.w600),
              unselectedLabelColor: Colors.black,
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600)),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          iconTheme: IconThemeData(color: Colors.grey)),
      initialRoute: '/',
      onGenerateRoute: AppRouter.generateRoute,
      // routes: {
      //   '/':(context) => LoginPage(),
      //   Route.AKTIVASI_AKUN:(context) => AktivasiAkunPage(),
      //   Route.VERIFIKASI_AKUN:(context) => VerifikasiAkunPage(),
      //   Route.CREATE_PASSWORD:(context) => CreatePasswordPage(),
      //   Route.DASHBOARD:(context) => DashboardPage()
      // }
    );
  }
}
