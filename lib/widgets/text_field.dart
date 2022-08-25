import 'package:flutter/material.dart';
import 'package:sih/constants/color.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  const CustomTextField({Key? key, required this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        floatingLabelStyle: const TextStyle(color: AppColors.primaryColor),
        focusColor: AppColors.primaryColor,
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor)),
        labelText: hint,
        labelStyle: const TextStyle(fontSize: 20.0),
      ),
    );
  }
}
