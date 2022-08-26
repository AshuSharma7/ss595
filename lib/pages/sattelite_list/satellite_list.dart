import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sih/constants/color.dart';
import 'package:sih/pages/base/base_view.dart';
import 'package:sih/pages/base/view_state.dart';
import 'package:sih/pages/sattelite_list/satellist_view_model.dart';
import 'package:sih/pages/sensor_details/sensor_details.dart';
import 'package:sih/pages/tle_details/tle_details.dart';
import 'package:sih/utils/location.dart';
import 'package:sih/utils/size_util.dart';
import 'package:sih/widgets/drop_down.dart';
import 'package:sih/widgets/loading_indicator.dart';
import 'package:sih/widgets/primary_button.dart';
import 'package:sih/widgets/text_field.dart';

class SatellisteListPage extends StatefulWidget {
  const SatellisteListPage({Key? key}) : super(key: key);

  @override
  State<SatellisteListPage> createState() => _SatellisteListPageState();
}

class _SatellisteListPageState extends State<SatellisteListPage> {
  String? selectedValue;

  String? selectedType;

  List<dynamic> category = [
    {"name": "By Satellite Name", "id": "satellite"},
    {"name": "By Sensor Name", "id": "sensor"},
    {"name": "By Application", "id": "application"}
  ];

  @override
  Widget build(BuildContext context) {
    return BaseView<SatelliteViewModel>(onModelReady: (model) {
      model.getSatelliteList();
    }, builder: (context, model, widget) {
      return Scaffold(
        body: model.currentState == ViewState.Busy
            ? const Center(
                child: LoadingIndicator(),
              )
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // const SizedBox(
                    //   height: 50.0,
                    // ),
                    // Row(
                    //   children: [
                    //     const Text(
                    //       'Select Satellite',
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.bold, fontSize: 28.0),
                    //     ),
                    //     const Spacer(),
                    //     Image.asset('assets/logo/isro_logo.png',
                    //         height: SizeUtil.getHeight(context) * 0.08),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      'Please select any type',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 15.0),
                    ),
                    const SizedBox(height: 20.0),
                    CustomDropDown(
                        hint: "Select Type",
                        items: category
                            .map((e) => DropdownMenuItem(
                                value: e["id"].toString(),
                                child: Text(e["name"] ?? '')))
                            .toList(),
                        onChange: (value) {
                          setState(() {
                            selectedType = value;
                          });
                          if (selectedType == "satellite") {
                            model.getSatelliteList();
                          } else if (selectedType == "sensor") {
                            model.getSensorList();
                          } else if (selectedType == "application") {
                            model.getApplicationList();
                          }
                        },
                        selectedValue: selectedType),
                    const SizedBox(
                      height: 20.0,
                    ),
                    if (selectedType != null && selectedType == "satellite")
                      CustomSearchableDropDown(
                        items: model.satellites,
                        label: "Select Satellite",
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: AppColors.primaryColor),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Icon(Icons.search),
                        ),
                        dropDownMenuItems:
                            model.satellites.map((e) => e["Name"]).toList(),
                        onChanged: (value) {
                          setState(() {
                            model.satellistId = value["id"].toString();
                          });
                        },
                      ),
                    if (selectedType != null && selectedType == "sensor")
                      CustomSearchableDropDown(
                        items: model.sensors,
                        label: "Select Sensors",
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: AppColors.primaryColor),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Icon(Icons.search),
                        ),
                        dropDownMenuItems:
                            model.sensors.map((e) => e["SensorName"]).toList(),
                        onChanged: (value) {
                          setState(() {
                            model.sensorId = value["SensorName"].toString();
                          });
                        },
                      ),
                    if (selectedType != null && selectedType == "application")
                      CustomSearchableDropDown(
                        items: model.applications,
                        label: "Select Application",
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: AppColors.primaryColor),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Icon(Icons.search),
                        ),
                        dropDownMenuItems: model.applications,
                        onChanged: (value) {
                          setState(() {
                            model.applicationId = value;
                          });
                        },
                      ),
                    const SizedBox(
                      height: 20.0,
                    ),

                    // if (selectedType == "satellite" &&
                    //     model.satellistId != null)
                    //   CustomDropDown(
                    //       hint: "Select Sensor Id",
                    //       items: model.sensors
                    //           .map((e) => DropdownMenuItem(
                    //               value: e['id'].toString(),
                    //               child: Text(e["name"])))
                    //           .toList(),
                    //       onChange: (value) {
                    //         setState(() {
                    //           model.applicationId = value;
                    //         });
                    //       },
                    //       selectedValue: model.applicationId),
                    // const SizedBox(
                    //   height: 20.0,
                    // ),
                    // if (selectedType == "sensor" && model.sensorId != null)
                    //   CustomDropDown(
                    //       hint: "Select Satellite",
                    //       items: model.sensors
                    //           .map((e) => DropdownMenuItem(
                    //               value: e['id'].toString(),
                    //               child: Text(e["name"])))
                    //           .toList(),
                    //       onChange: (value) {
                    //         setState(() {
                    //           model.applicationId = value;
                    //           model.getSatelliteBySensor();
                    //         });
                    //       },
                    //       selectedValue: model.applicationId),
                    const CustomTextField(hint: "Latitude"),
                    const CustomTextField(hint: "Longitude"),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Center(child: Text("OR")),
                    const SizedBox(
                      height: 20.0,
                    ),
                    GestureDetector(
                      onTap: () async {
                        Position position = await determinePosition();
                        model.lat = position.latitude;
                        model.long = position.longitude;
                        setState(() {});
                      },
                      child: Container(
                        width: SizeUtil.getWidth(context),
                        height: SizeUtil.getHeight(context) * 0.06,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.primaryColor)),
                        child: Center(
                          child: Text(model.lat != null
                              ? "Latitude: ${model.lat} Longitude ${model.long}"
                              : "Use my current location"),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Spacer(),
                    PrimaryButton(
                      child: const Center(
                        child: Text("Search"),
                      ),
                      onTap: () {
                        if (selectedType == null) return;
                        if (selectedType == "application") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TleDetailsPage(
                                      id: model.applicationId ?? "",
                                      selectedType:
                                          selectedType ?? 'application')));
                        } else if (selectedType == "satellite") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TleDetailsPage(
                                      id: model.satellistId ?? "",
                                      selectedType:
                                          selectedType ?? 'satellite')));
                        } else if (selectedType == "sensor") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SensorDetails(
                                        sensor: model.sensorId ?? "",
                                      )));
                        }
                      },
                    ),
                    const SizedBox(
                      height: 50.0,
                    )
                  ],
                ),
              ),
      );
    });
  }
}
