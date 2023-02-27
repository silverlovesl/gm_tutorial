import 'package:flutter/material.dart';

/// Theme context
class GMTheme {
  static const fmPFSC = "PingFang-SC";
  // Hex opacity references https://gist.github.com/creativecreatorormaybenot/8710f6f752f6a0f2cae13abb538f0e8e
  //
  static const cBandBlack = Color(0xff000000);
  static const cBandWhite = Color(0xffffffff);

  static const cBackground = Color.fromRGBO(247, 247, 247, 1);
  static const tsTitle = TextStyle(fontFamily: fmPFSC, color: GMTheme.cBandBlack, fontSize: 24);
}
