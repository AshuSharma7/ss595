import 'package:dio/dio.dart';
import 'package:sih/data/AppConstants.dart';
import 'package:sih/data/CommonFunctions.dart';
import 'package:sih/pages/base/base_view_model.dart';
import 'package:sih/pages/base/view_state.dart';

class SensorDetailsViewModel extends BaseModel {
  List<dynamic> sensorList = [];

  List<dynamic> tleData = [];

  String tle = "";

  List<dynamic> satelliteList = [];

  List<String> tleList = [];

  String? sensorId;

  getSensorList(String id) async {
    setState(ViewState.Busy);
    try {
      final response = await Dio().get(
        "$baseUrl$sensor$id",
      );
      print(response.data);
      sensorList = response.data;
      setState(ViewState.Idle);
    } catch (e) {
      showGetxBar("Error", "Some Error Occurred");
      setState(ViewState.Idle);
    }
  }

  getTleData(String satelliteName, String id) async {
    setState(ViewState.Busy);
    try {
      final response = await Dio().get("$baseUrl$sensor$id/$satelliteName");
      tleData = response.data;
      print("$baseUrl$sensor$id/$satelliteName");
      print("$baseUrl$getTle$satelliteName");
      final res = await Dio().get("$baseUrl$getTle$satelliteName");
      // tle = res.data;
      if (res.data.isNotEmpty) {
        tleList = res.data[0].split("\r\n");
      }
      print(res.data);
      setState(ViewState.Idle);
    } catch (e) {
      showGetxBar("Error", "Some Error Occurred");
      setState(ViewState.Idle);
    }
  }
}
