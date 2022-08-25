import 'package:flutter/material.dart';

class SizeUtil {
  static double getHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidth(context) {
    return MediaQuery.of(context).size.width;
  }
}
