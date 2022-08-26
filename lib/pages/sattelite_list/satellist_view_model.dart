import 'package:dio/dio.dart';
import 'package:sih/data/AppConstants.dart';
import 'package:sih/pages/base/base_view_model.dart';
import 'package:sih/pages/base/view_state.dart';

class SatelliteViewModel extends BaseModel {
  String? satellistId;
  String? sensorId;
  String? applicationId;
  List<dynamic> satellites = [];
  List<dynamic> sensors = [];

  double? lat;
  double? long;

  List<String> applications = [];

  getSatelliteList() async {
    setState(ViewState.Busy);
    final response = await Dio().get(
      baseUrl + satellite,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      satellites = response.data;
    }
    setState(ViewState.Idle);
  }

  getSensorList() async {
    setState(ViewState.Busy);
    final response = await Dio().get(
      baseUrl + sensor,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      sensors = response.data;
    }
    setState(ViewState.Idle);
  }

  getApplicationList() async {
    setState(ViewState.Busy);
    final response = await Dio().get(
      baseUrl + application,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      for (int i = 0; i < response.data.length; i++) {
        if (response.data[i]["application1"] != null &&
            !applications.contains(response.data[i]["application1"])) {
          applications.add(response.data[i]["application1"]);
        }
        if (response.data[i]["application2"] != null &&
            !applications.contains(response.data[i]["application2"])) {
          applications.add(response.data[i]["application2"]);
        }
        if (response.data[i]["application3"] != null &&
            !applications.contains(response.data[i]["application3"])) {
          applications.add(response.data[i]["application3"]);
        }
      }
    }
    setState(ViewState.Idle);
  }

  getSatelliteBySensor() async {
    setState(ViewState.Busy);
    final response = await Dio().get(
      "$baseUrl$sensor$satellistId",
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      satellites = response.data;
    }
    setState(ViewState.Idle);
  }

  getTleBySatellite() async {
    setState(ViewState.Busy);
    final response = await Dio().get(
      "$baseUrl$satellite$satellistId",
    );
  }
}
