import 'package:flutter/material.dart';

/// Theme context
/// https://www.figma.com/file/MIi4Sxgr8gzMQ7Q8qJaZyg/DG-APP-Epic---WIP?node-id=3%3A573&t=idURLj18boISz7d7-0
class GMTheme {
  static const fmPFSC = "PingFang-SC";
  static const fmNSSC = "NotoSans-SC";
  // Hex opacity references https://gist.github.com/creativecreatorormaybenot/8710f6f752f6a0f2cae13abb538f0e8e
  static const cBandBlack = Color(0xff00131d);
  static const cBandWhite = Color(0xfff6f6f6);

  static const cAccentSuperBlue = Color(0xff191eb4);
  static const cAccentBlue = Color(0xff182865);
  static const cAccentGreen = Color(0xff005648);
  static const cAccentYellow = Color(0xfffdeaa5);

  static const cMonchromeBlack = Color(0xff00131d);
  static const cMonchromeBlackGrey = Color(0xff2c313a);
  static const cMonchromeDarkGrey = Color(0xff6a6e74);
  static const cMonchromeBgMidGrey = Color(0xff8f9296);

  static const cMonchromeLightGrey = Color(0xffb7babc);
  static const cMonchromeLightestGrey = Color(0xffdadbdc);
  static const cMonchromeWhiteGrey = Color(0xfff6f6f6);
  static const cMonchromePureGrey = Color(0xffffffff);

  static const cFunctionalHighlight = Color(0xffd83516);
  static const cFunctionalSuccess = Color(0xff24cb71);
  static const cFunctionalInformation = Color(0xfff2cb04);

  static const cTextBlack = Color(0xff00131d);
  static const cTextSecondary = Color(0xff6a6e74);
  static const cTextTertiary = Color(0xff8f9296);
  static const cTextQuaternary = Color(0xffb7babc);

  static const cFillPrimary = Color(0xffFFFFFF);
  static const cFillSecondary = Color(0xfff6f6f6);
  static const cFillTertiary = Color(0xffdadbdc);

  static const cNavBarBackground = Color.fromRGBO(0, 19, 29, 0.8);
  static const cMainPageBackground = Color(0xff01131F);

  static const cRegisterPageBackground = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.centerRight,
    stops: [0, 0.4366, 1],
    colors: [
      Color.fromRGBO(0, 19, 29, 0.6),
      Color(0xff00131D),
      Color(0xff00131D),
    ],
  );
}
