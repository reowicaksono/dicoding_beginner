import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(32, 48, 114, .1),
  100: Color.fromRGBO(32, 48, 114, .2),
  200: Color.fromRGBO(32, 48, 114, .3),
  300: Color.fromRGBO(32, 48, 114, .4),
  400: Color.fromRGBO(32, 48, 114, .5),
  500: Color.fromRGBO(32, 48, 114, .6),
  600: Color.fromRGBO(32, 48, 114, .7),
  700: Color.fromRGBO(32, 48, 114, .8),
  800: Color.fromRGBO(32, 48, 114, .9),
  900: Color.fromRGBO(32, 48, 114, 1),
};

MaterialColor primarySwatch = MaterialColor(0xFF2F3866, color);
const Color mainColor = Color(0xFF2F3866);
const Color secondaryColor = Color(0xFF0D90F3);
const Color mainYellow = Color(0xFFFEDF02);
const Color skyBlue = Color(0xFF456FE7);
const Color mainOrange = Color(0xFFFFAA33);
Color mainGreen = Color(0xFF219653);
Color lightGreen = Color(0xFF59C633);
Color darkGrey = Color(0xFF686868);
Color backgroundGrey = Color(0xFFF9F9F9);
const Color lightGrey = Color(0xFFF5F5F5);
Color buttonRequest = Color(0xFFD3D4E2);
const Color redColor = Color(0xFFEB5757);
const Color whiteColor = Color(0xFFFFFFFF);
const Color blackColor = Color(0xFF000000);

double mainMargin = 18;
double mainPadding = 18;
double marginTitleContent = 6;
double marginBetweenSection = 12;
double buttonRoundedRadius = 24;
double mainBorderRadius = 10;
double cardElevation = 2;
double titleFormTableWidth = 120.0;
double resourceQtyTableWidth = 90.0;

String fontFamily = 'Nunito';

TextStyle BlackText =
    GoogleFonts.poppins(fontWeight: FontWeight.w500, color: blackColor);
TextStyle BlueText =
    GoogleFonts.poppins(fontWeight: FontWeight.w500, color: skyBlue);
TextStyle WhiteText =
    GoogleFonts.roboto(fontWeight: FontWeight.w500, color: whiteColor);
TextStyle GreyText =
    GoogleFonts.roboto(fontWeight: FontWeight.w500, color: darkGrey);
