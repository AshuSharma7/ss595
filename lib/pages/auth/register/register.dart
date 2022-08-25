import 'package:flutter/material.dart';
import 'package:sih/constants/color.dart';
import 'package:sih/utils/size_util.dart';
import 'package:sih/widgets/text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50.0,
              ),
              Row(
                children: [
                  const Text(
                    'Welcome',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                  const Spacer(),
                  Image.asset('assets/logo/isro_logo.png',
                      height: SizeUtil.getHeight(context) * 0.08),
                ],
              ),
              const Text(
                'Please Register to continue',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
              ),
              SizedBox(height: SizeUtil.getHeight(context) * 0.1),
              const CustomTextField(hint: "Full Name"),
              const CustomTextField(hint: "Email"),
              const CustomTextField(hint: "Password"),
              const CustomTextField(hint: "Confirm Password"),
              SizedBox(height: SizeUtil.getHeight(context) * 0.1),
              Container(
                width: SizeUtil.getWidth(context) * 0.4,
                height: SizeUtil.getHeight(context) * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primaryColor),
                child: const Center(
                  child: Text("Register"),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: const [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14.0),
                    ),
                    Text(
                      'Back to Login',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                          color: AppColors.primaryColor),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
