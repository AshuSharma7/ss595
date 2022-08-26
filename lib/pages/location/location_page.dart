import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sih/constants/color.dart';
import 'package:sih/pages/user_tab/user_tab.dart';
import 'package:sih/utils/size_util.dart';
import 'package:sih/widgets/text_field.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50.0,
              ),
              Row(
                children: [
                  const Text(
                    'Select Your\nLocation',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
                  ),
                  const Spacer(),
                  Image.asset('assets/logo/isro_logo.png',
                      height: SizeUtil.getHeight(context) * 0.08),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Enter your address or use current location',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
              ),
              SizedBox(height: SizeUtil.getHeight(context) * 0.1),
              const CustomTextField(hint: "Street Adress"),
              const CustomTextField(hint: "City"),
              const CustomTextField(hint: "State"),
              const CustomTextField(hint: "PinCode"),
              const SizedBox(
                height: 20.0,
              ),
              const Center(child: Text("OR")),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: SizeUtil.getWidth(context),
                height: SizeUtil.getHeight(context) * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.primaryColor)),
                child: const Center(
                  child: Text("Use my current location"),
                ),
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const UserTabPage()));
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: SizeUtil.getWidth(context) * 0.4,
                    height: SizeUtil.getHeight(context) * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primaryColor),
                    child: const Center(
                      child: Text("Submit"),
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeUtil.getHeight(context) * 0.1),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
