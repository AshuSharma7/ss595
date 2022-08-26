import 'package:get_it/get_it.dart';
import 'package:sih/pages/orbital_element/orbital_view_model.dart';
import 'package:sih/pages/sattelite_list/satellist_view_model.dart';
import 'package:sih/pages/sensor_details/sensor_details_view_model.dart';
import 'package:sih/pages/tle_details/tle_details_view_model.dart';
import 'package:sih/pages/user_tab/user_tab_vview_model.dart';

GetIt locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton(() => SatelliteViewModel());
  locator.registerLazySingleton(() => UserTabViewModel());
  locator.registerLazySingleton(() => TleDetailsViewModel());
  locator.registerLazySingleton(() => SensorDetailsViewModel());
  locator.registerLazySingleton(() => OrbitalViewModel());
}
