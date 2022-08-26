import 'package:flutter/material.dart';
import 'package:sih/constants/color.dart';
import 'package:sih/utils/size_util.dart';

class CustomDropDown extends StatelessWidget {
  final String? selectedValue;
  final List<DropdownMenuItem> items;
  final Function onChange;
  final String? hint;
  const CustomDropDown(
      {Key? key,
      required this.items,
      required this.onChange,
      this.hint,
      required this.selectedValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeUtil.getWidth(context),
      padding: const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10.0)),
      child: Center(
        child: DropdownButton(
            underline: const SizedBox(),
            value: selectedValue,
            icon: const SizedBox(),
            borderRadius: BorderRadius.circular(10.0),
            dropdownColor: Colors.white,
            style: const TextStyle(color: Colors.black),
            hint: Text(hint ?? ""),
            items: items,
            onChanged: (dynamic value) {
              onChange(value);
            }),
      ),
    );
  }
}
