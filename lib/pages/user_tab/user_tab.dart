import 'package:flutter/material.dart';
import 'package:sih/pages/base/base_view.dart';
import 'package:sih/pages/sattelite_list/satellite_list.dart';
import 'package:sih/pages/user_tab/user_tab_vview_model.dart';

class UserTabPage extends StatefulWidget {
  const UserTabPage({Key? key}) : super(key: key);

  @override
  State<UserTabPage> createState() => _UserTabPageState();
}

class _UserTabPageState extends State<UserTabPage>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<UserTabViewModel>(
        onModelReady: (model) {},
        builder: (context, model, widget) {
          return Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                    labelColor: Colors.white,
                    controller: controller,
                    tabs: const [
                      Tab(
                        text: "User Input",
                      ),
                      Tab(text: "TLE"),
                      Tab(
                        text: "Footprint",
                      )
                    ]),
              ),
              body: TabBarView(controller: controller, children: const [
                SatellisteListPage(),
                SatellisteListPage(),
                SatellisteListPage(),
              ]));
        });
  }
}
