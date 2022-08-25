import 'package:flutter/material.dart';

import 'view_state.dart';

class BaseModel extends ChangeNotifier {
  ViewState currentState = ViewState.Idle;

  String successCode = "0000";

  @override
  // ignore: must_call_super
  void dispose() {}

  setState(ViewState state) {
    currentState = state;
    notifyListeners();
  }

  refreshScreen() {
    notifyListeners();
  }
}
