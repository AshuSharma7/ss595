import 'package:flutter/material.dart';
import 'package:sih/pages/base/base_view.dart';
import 'package:sih/pages/base/view_state.dart';
import 'package:sih/pages/orbital_element/orbital_view_model.dart';
import 'package:sih/utils/size_util.dart';
import 'package:sih/widgets/loading_indicator.dart';

class OrbitalElementView extends StatelessWidget {
  final String satelliteName;
  const OrbitalElementView({Key? key, required this.satelliteName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<OrbitalViewModel>(builder: (context, model, child) {
      return Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: model.currentState == ViewState.Busy
              ? const Center(
                  child: LoadingIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50.0,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Orbital Element',
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
                    if (model.orbitalData.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Satellite Name: ${model.orbitalData[0]["OBJECT_NAME"]}",
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "EPOCH: ${model.orbitalData[0]["EPOCH"]}",
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "MEAN MOTION: ${model.orbitalData[0]["MEAN_MOTION"]}",
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "INCLINATION: ${model.orbitalData[0]["INCLINATION"]}",
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "ECCENTRICITY: ${model.orbitalData[0]["ECCENTRICITY"]}",
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "RA_OF_ASC_NODE: ${model.orbitalData[0]["RA_OF_ASC_NODE"]}",
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "ARG_OF_PERICENTER: ${model.orbitalData[0]["ARG_OF_PERICENTER"]}",
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "ARG_OF_PERICENTER: ${model.orbitalData[0]["ARG_OF_PERICENTER"]}",
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "MEAN_ANOMALY: ${model.orbitalData[0]["MEAN_ANOMALY"]}",
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "ARG_OF_PERICENTER: ${model.orbitalData[0]["ARG_OF_PERICENTER"]}",
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "EPHEMERIS_TYPE: ${model.orbitalData[0]["EPHEMERIS_TYPE"]}",
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "CLASSIFICATION_TYPE: ${model.orbitalData[0]["CLASSIFICATION_TYPE"]}",
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "CLASSIFICATION_TYPE: ${model.orbitalData[0]["CLASSIFICATION_TYPE"]}",
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "NORAD_CAT_ID: ${model.orbitalData[0]["NORAD_CAT_ID"]}",
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "ELEMENT_SET_NO: ${model.orbitalData[0]["ELEMENT_SET_NO"]}",
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "REV_AT_EPOCH: ${model.orbitalData[0]["REV_AT_EPOCH"]}",
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "BSTAR: ${model.orbitalData[0]["BSTAR"]}",
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "MEAN_MOTION_DOT: ${model.orbitalData[0]["MEAN_MOTION_DOT"]}",
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "MEAN_MOTION_DDOT: ${model.orbitalData[0]["MEAN_MOTION_DDOT"]}",
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                        ],
                      )
                  ],
                ),
        ),
      );
    }, onModelReady: (model) {
      model.getOrbitalData(satelliteName);
    });
  }
}
