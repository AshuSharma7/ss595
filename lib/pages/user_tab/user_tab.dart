import 'package:flutter/material.dart';
import 'package:sih/constants/color.dart';
import 'package:sih/pages/base/base_view.dart';
import 'package:sih/pages/user_tab/user_tab_vview_model.dart';
import 'package:sih/utils/size_util.dart';

class UserTabPage extends StatelessWidget {
  const UserTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<UserTabViewModel>(
        onModelReady: (model) {},
        builder: (context, model, widget) {
          return Scaffold(
            body: SafeArea(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          model.changeTab(0);
                        },
                        child: Container(
                          width: SizeUtil.getWidth(context) * 0.25,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15.0),
                                topLeft: Radius.circular(15.0)),
                            color: model.selectedTab == 0
                                ? AppColors.primaryColor
                                : Colors.black87,
                          ),
                          child: const Center(
                            child: Text("User Input"),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          model.changeTab(1);
                        },
                        child: Container(
                          width: SizeUtil.getWidth(context) * 0.25,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: model.selectedTab == 1
                                ? AppColors.primaryColor
                                : Colors.black87,
                          ),
                          child: const Center(
                            child: Text("TLE"),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          model.changeTab(2);
                        },
                        child: Container(
                          width: SizeUtil.getWidth(context) * 0.25,
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(15.0),
                                bottomRight: Radius.circular(15.0)),
                            color: model.selectedTab == 2
                                ? AppColors.primaryColor
                                : Colors.black87,
                          ),
                          child: const Center(
                            child: Text("Footprint"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  model.screens[model.selectedTab],
                ],
              ),
            ),
          );
        });
  }
}
