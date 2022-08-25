import 'package:flutter/material.dart';
import 'package:sih/pages/base/base_view.dart';
import 'package:sih/pages/base/view_state.dart';
import 'package:sih/pages/sattelite_list/satellist_view_model.dart';
import 'package:sih/utils/size_util.dart';
import 'package:sih/widgets/drop_down.dart';
import 'package:sih/widgets/loading_indicator.dart';

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
                  children: [
                    const SizedBox(
                      height: 50.0,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Select Satellite',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 28.0),
                        ),
                        const Spacer(),
                        Image.asset('assets/logo/isro_logo.png',
                            height: SizeUtil.getHeight(context) * 0.08),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      'Please select any type',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 15.0),
                    ),
                    const SizedBox(height: 10.0),
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
                      CustomDropDown(
                          items: model.sensors
                              .map((e) => DropdownMenuItem(
                                  value: e['satelliteId'],
                                  child: Text(e["name"])))
                              .toList(),
                          onChange: (value) {
                            setState(() {
                              selectedType = value;
                            });
                          },
                          selectedValue: selectedValue),
                    if (selectedType != null && selectedType == "sensor")
                      CustomDropDown(
                          items: model.sensors
                              .map((e) => DropdownMenuItem(
                                  value: e['satelliteId'],
                                  child: Text(e["name"])))
                              .toList(),
                          onChange: (value) {
                            setState(() {
                              selectedType = value;
                            });
                          },
                          selectedValue: selectedValue),
                    if (selectedType != null && selectedType == "application")
                      CustomDropDown(
                          items: model.sensors
                              .map((e) => DropdownMenuItem(
                                  value: e['satelliteId'],
                                  child: Text(e["name"])))
                              .toList(),
                          onChange: (value) {
                            setState(() {
                              selectedType = value;
                            });
                          },
                          selectedValue: selectedValue)
                  ],
                ),
              ),
      );
    });
  }
}
