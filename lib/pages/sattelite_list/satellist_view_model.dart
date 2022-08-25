import 'package:dio/dio.dart';
import 'package:sih/data/AppConstants.dart';
import 'package:sih/data/model/get_tle_response_model.dart';
import 'package:sih/pages/base/base_view_model.dart';
import 'package:sih/pages/base/view_state.dart';

class SatelliteViewModel extends BaseModel {
  List<Member> satelliteList = [];

  List<dynamic> satellites = [];
  List<dynamic> sensors = [];

  getSatelliteList() async {
    setState(ViewState.Busy);
    final response = await Dio().get(
      baseUrl + getTle,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      satellites = response.data["member"];
    }
    setState(ViewState.Idle);
  }

  getSensorList() async {
    setState(ViewState.Busy);
    final response = await Dio().get(
      baseUrl + sensor,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      sensors = response.data["member"];
    }
    setState(ViewState.Idle);
  }

  getApplicationList() async {
    setState(ViewState.Busy);
    final response = await Dio().get(
      baseUrl + application,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      sensors = response.data["member"];
    }
    setState(ViewState.Idle);
  }
}
