import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sih/constants/color.dart';

class LoadingIndicator extends StatelessWidget {
  final Color? color;
  const LoadingIndicator({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitThreeBounce(
        color: color ?? AppColors.primaryColor,
        size: 30.0,
      ),
    );
  }
}
