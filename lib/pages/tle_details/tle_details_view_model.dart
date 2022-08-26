import 'package:dio/dio.dart';
import 'package:sih/data/AppConstants.dart';
import 'package:sih/data/CommonFunctions.dart';
import 'package:sih/pages/base/base_view_model.dart';
import 'package:sih/pages/base/view_state.dart';

class TleDetailsViewModel extends BaseModel {
  List<dynamic> data = [];

  Map<String, dynamic> tleData = {};

  getData(String type, String id) async {
    setState(ViewState.Busy);
    if (type == "application") {
      final response = await Dio().get(
        "$baseUrl$application$id",
      );
      data = response.data;
    } else if (type == "satellite") {
      final response = await Dio().get(
        "$baseUrl$getTle$id",
      );
      data = response.data;
    } else if (type == "sensor") {
      final response = await Dio().get(
        "$baseUrl$sensor$id",
      );
      data = response.data;
    }
    setState(ViewState.Idle);
  }

  getTleData(String id) async {
    setState(ViewState.Busy);
    try {
      final response = await Dio().get(
        "$baseUrl$getTle${id.toUpperCase()}",
      );
      tleData = response.data;
      print(response.data);
      setState(ViewState.Idle);
    } catch (e) {
      showGetxBar("Error", "Some Error Occurred");
      setState(ViewState.Idle);
    }
  }
}
