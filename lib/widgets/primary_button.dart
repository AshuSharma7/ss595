import 'package:flutter/material.dart';
import 'package:sih/constants/color.dart';
import 'package:sih/utils/size_util.dart';

class PrimaryButton extends StatelessWidget {
  final Function() onTap;
  final Widget child;
  const PrimaryButton({Key? key, required this.onTap, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeUtil.getWidth(context) * 0.4,
        height: SizeUtil.getHeight(context) * 0.06,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primaryColor),
        child: Center(child: child),
      ),
    );
  }
}
