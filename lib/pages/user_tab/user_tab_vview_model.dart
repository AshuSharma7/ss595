import 'package:flutter/material.dart';
import 'package:sih/pages/base/base_view_model.dart';
import 'package:sih/pages/sattelite_list/satellite_list.dart';
import 'package:sih/pages/user_input/user_input.dart';

class UserTabViewModel extends BaseModel {
  int selectedTab = 0;

  List<Widget> screens = [
    const SatellisteListPage(),
    const SatellisteListPage(),
    const SatellisteListPage(),
  ];

  changeTab(int index) {
    selectedTab = index;
    notifyListeners();
  }
}
