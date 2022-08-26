import 'package:dio/dio.dart';
import 'package:sih/data/AppConstants.dart';
import 'package:sih/pages/base/base_view_model.dart';
import 'package:sih/pages/base/view_state.dart';

class OrbitalViewModel extends BaseModel {
  List<dynamic> orbitalData = [];

  getOrbitalData(String name) async {
    setState(ViewState.Busy);
    try {
      final response = await Dio().get('$baseUrl$orbitalElement$name');
      orbitalData = response.data;
      print(orbitalData[0]);
      setState(ViewState.Idle);
    } catch (e) {
      setState(ViewState.Idle);
    }
  }
}
