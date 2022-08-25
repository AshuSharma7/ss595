import 'package:flutter/material.dart';
import 'package:sih/utils/size_util.dart';
import 'package:get/get.dart';

class UserInputPage extends StatelessWidget {
  final String selectedType;
  final String name;
  const UserInputPage(
      {Key? key, required this.selectedType, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50.0,
          ),
          Row(
            children: [
              const Text(
                'Enter details to get TLE',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
              ),
              const Spacer(),
              Image.asset('assets/logo/isro_logo.png',
                  height: SizeUtil.getHeight(context) * 0.08),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            '${selectedType.capitalizeFirst}: $name',
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
