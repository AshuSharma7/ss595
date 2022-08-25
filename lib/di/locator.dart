import 'package:get_it/get_it.dart';
import 'package:sih/pages/sattelite_list/satellist_view_model.dart';
import 'package:sih/pages/user_tab/user_tab_vview_model.dart';

GetIt locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton(() => SatelliteViewModel());
  locator.registerLazySingleton(() => UserTabViewModel());
}
