import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:sih/constants/color.dart';
import 'package:sih/pages/base/base_view.dart';
import 'package:sih/pages/orbital_element/orbital_element_view.dart';
import 'package:sih/pages/sensor_details/sensor_details_view_model.dart';
import 'package:sih/utils/size_util.dart';
import 'package:sih/widgets/primary_button.dart';

class SensorDetails extends StatefulWidget {
  final String sensor;
  const SensorDetails({Key? key, required this.sensor}) : super(key: key);

  @override
  State<SensorDetails> createState() => _SensorDetailsState();
}

class _SensorDetailsState extends State<SensorDetails> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SensorDetailsViewModel>(builder: (context, model, ch) {
      return Scaffold(
          body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 50.0,
            ),
            Row(
              children: [
                const Text(
                  'Sensor and\nSatellite Details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
                ),
                const Spacer(),
                Image.asset('assets/logo/isro_logo.png',
                    height: SizeUtil.getHeight(context) * 0.08),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            if (model.sensorList.isNotEmpty)
              CustomSearchableDropDown(
                items: model.sensorList,
                label: "Select Satellite for ${widget.sensor}",
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.primaryColor),
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Icon(Icons.search),
                ),
                dropDownMenuItems:
                    model.sensorList.map((e) => e["SatelliteName"]).toList(),
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    model.sensorId = value["SatelliteName"];
                  });
                  model.getTleData(model.sensorId ?? "", widget.sensor);
                },
              ),
            const SizedBox(
              height: 20.0,
            ),
            if (model.sensorId != null)
              Center(
                child: PrimaryButton(
                    onTap: () {
                      model.getTleData(model.sensorId ?? "", widget.sensor);
                    },
                    child: const Center(
                      child: Text("Get TLE"),
                    )),
              ),
            const SizedBox(
              height: 50.0,
            ),
            if (model.tleData.isNotEmpty)
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: const Text(
                    "Info",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            const SizedBox(
              height: 20.0,
            ),
            ...model.tleData
                .map((e) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (model.tleData.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Satellite Name :" "${e["SatelliteName"]}"),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text("Sensor Name :" "${e["SensorName"]}"),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text("Swath :" "${e["Swath"]}"),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text("TiltFore: ${e["TiltFore"]}"),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text("TiltAft: ${e["TiltAft"]}"),
                            ],
                          ),
                        const SizedBox(
                          height: 50.0,
                        ),
                      ],
                    ))
                .toList(),
            if (model.tleList.isNotEmpty)
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: const Text(
                    "TLE Data",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            const SizedBox(
              height: 20.0,
            ),
            if (model.tle.isNotEmpty)
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: const Text(
                    "TLE Data",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            if (model.tleList.isNotEmpty)
              Column(
                children: [
                  Text(model.tleList[0]),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(model.tleList[1]),
                ],
              ),
            const SizedBox(
              height: 20.0,
            ),
            PrimaryButton(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrbitalElementView(
                              satelliteName: model.sensorId ?? "")));
                },
                child: const Center(
                  child: Text("Get Orbiatl data"),
                )),
            const SizedBox(
              height: 90.0,
            ),
          ],
        ),
      ));
    }, onModelReady: (model) {
      model.sensorId = null;
      model.tleData.clear();
      model.getSensorList(widget.sensor);
    });
  }
}
