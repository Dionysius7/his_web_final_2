import 'package:flutter/material.dart';
import 'package:his_web_final/widgets/bottom_bar.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        color: Color(0xff008c74),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width,
                  // color: Colors.red,
                  height: size.height / 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Main Menu",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width / 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    Get.toNamed('/dashboard/request');
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset(
                              "assets/condition_menu_icon.png",
                              width: size.width / 15,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Request Condition",
                                style: TextStyle(
                                    color: Color(0xff008c74),
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width / 80)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: size.width / 10),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed('/dashboard/find');
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset(
                              "assets/search_menu_icon.png",
                              width: size.width / 15,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Find Condition",
                                style: TextStyle(
                                    color: Color(0xff008c74),
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width / 80)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: size.width / 10),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed('/dashboard/create');
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset(
                              "assets/register_menu_icon.png",
                              width: size.width / 15,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Create Condition",
                                style: TextStyle(
                                    color: Color(0xff008c74),
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width / 80)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            BottomBar(),
          ],
        ),
      ),
    );
  }
}
