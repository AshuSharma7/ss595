import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sih/constants/color.dart';
import 'package:sih/pages/auth/register/register.dart';
import 'package:sih/pages/location/location_page.dart';
import 'package:sih/utils/size_util.dart';
import 'package:sih/widgets/loading_indicator.dart';
import 'package:sih/widgets/text_field.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
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
                    'Welcome\nBack,',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
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
                'Please Login to continue',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
              ),
              SizedBox(height: SizeUtil.getHeight(context) * 0.16),
              const CustomTextField(hint: "Email"),
              const CustomTextField(hint: "Password"),
              SizedBox(height: SizeUtil.getHeight(context) * 0.1),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLoading = true;
                  });
                  Future.delayed(const Duration(seconds: 2), () {
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const LocationPage()));
                  });
                },
                child: Container(
                  width: SizeUtil.getWidth(context) * 0.4,
                  height: SizeUtil.getHeight(context) * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primaryColor),
                  child: Center(
                    child: isLoading
                        ? const LoadingIndicator(
                            color: Colors.white,
                          )
                        : const Text("Login"),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: ((context) => const RegisterPage())));
                },
                child: Row(
                  children: const [
                    Text(
                      'Dont\'t have an account? ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14.0),
                    ),
                    Text(
                      'Register',
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
