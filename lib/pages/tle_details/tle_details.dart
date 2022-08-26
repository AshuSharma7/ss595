import 'package:flutter/material.dart';
import 'package:sih/constants/color.dart';
import 'package:sih/pages/base/base_view.dart';
import 'package:sih/pages/base/view_state.dart';
import 'package:sih/pages/orbital_element/orbital_element_view.dart';
import 'package:sih/pages/tle_details/tle_details_view_model.dart';
import 'package:sih/utils/size_util.dart';
import 'package:sih/widgets/primary_button.dart';

class TleDetailsPage extends StatelessWidget {
  final String selectedType;
  final String id;
  const TleDetailsPage({Key? key, required this.id, required this.selectedType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<TleDetailsViewModel>(onModelReady: (model) {
      model.tleData = {};
      model.getData(selectedType, id);
    }, builder: (context, model, widget) {
      return Scaffold(
        body: model.currentState == ViewState.Busy
            ? const Center(child: CircularProgressIndicator())
            : Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 50.0,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Details',
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
                    if (selectedType == "application")
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...model.data
                              .map(
                                (e) => Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Text(
                                        "${e["SatelliteName"]}",
                                        style: const TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Text("Sensor Name :" "${e["SensorName"]}"),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Text("Swath :" "${e["Swath"]}Km"),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Text("TiltFore " "${e["TiltFore"]}"),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Text("TiltAft " "${e["TiltAft"]}"),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    if (e["application1"] != null)
                                      Text("Applicatioon : "
                                          "${e["application1"]}"),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    if (e["application2"] != null)
                                      Text("application 2 : "
                                          "${e["application2"]}"),
                                    if (e["application3"] != null)
                                      Text("application 3 : "
                                          "${e["application3"]}"),
                                    const SizedBox(
                                      height: 30.0,
                                    ),
                                    Center(
                                      child: PrimaryButton(
                                          onTap: () {
                                            model.getTleData(e["SatelliteName"]
                                                .toString()
                                                .toUpperCase());
                                          },
                                          child: const Center(
                                            child: Text("Get TLE"),
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    PrimaryButton(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      OrbitalElementView(
                                                          satelliteName: e[
                                                              "SatelliteName"])));
                                        },
                                        child: const Center(
                                          child: Text("Get Orbiatl data"),
                                        )),
                                  ],
                                ),
                              )
                              .toList(),
                          const SizedBox(
                            height: 20.0,
                          ),
                          if (model.tleData.isNotEmpty)
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: const Text(
                                "TLE Data",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          if (model.tleData.isNotEmpty)
                            Column(
                              children: [
                                Text(
                                    "Sensor Name :" "${model.tleData["name"]}"),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text("Date :" "${model.tleData["date"]}"),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text("${model.tleData["line1"]}"),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text("${model.tleData["line2"]}"),
                              ],
                            ),
                          const SizedBox(
                            height: 100.0,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
      );
    });
  }
}
