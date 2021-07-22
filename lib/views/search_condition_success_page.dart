import 'package:flutter/material.dart';
import 'package:his_web_final/controllers/hospital_condition_controller.dart';
import 'package:his_web_final/views/search_condition_detail_page.dart';
import 'package:his_web_final/widgets/bottom_bar.dart';
import 'package:get/get.dart';

class SearchConditionSuccessPage extends StatelessWidget {
  SearchConditionSuccessPage({required this.phrId});
  final String phrId;
  final hospitalConditionController = Get.put(HospitalConditionController());
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
            Row(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  width: size.width / 2,
                  height: size.height / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Condition List",
                              style: TextStyle(
                                color: Color(0xff008c74),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: size.height / 40),
                            Container(
                              width: size.width / 4,
                              height: size.height / 3,
                              // color: Colors.red,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FutureBuilder(
                                    future: hospitalConditionController
                                        .getHospitalConditionData(phrId),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        if (snapshot.data == "200") {
                                          return Expanded(
                                            child: ListView.builder(
                                              itemCount:
                                                  hospitalConditionController
                                                      .condition.length,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  width: size.width / 20,
                                                  color: Colors.grey[100],
                                                  child: ListTile(
                                                    title: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        //Left Side
                                                        Container(
                                                          // color: Colors.green,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            vertical: 15,
                                                            horizontal: 20,
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'ID : ${hospitalConditionController.condition[index].condition_id}',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 16,
                                                                ),
                                                              ),
                                                              Text(
                                                                '${hospitalConditionController.condition[index].extension!.valueString}',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 15,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        //Right Side
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            MaterialButton(
                                                                onPressed: () {
                                                                  //Buat nanti Detail Page
                                                                  Get.to(SearchConditionDetailPage(
                                                                      conditionData:
                                                                          hospitalConditionController
                                                                              .condition[index]));
                                                                },
                                                                child: Text(
                                                                    "Details"),
                                                                color: Color(
                                                                    0xff008c74),
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(5),
                                                                shape: new RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        new BorderRadius.circular(
                                                                            35))),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                        } else {
                                          return Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Center(
                                                  child: Text("No Data"),
                                                )
                                              ],
                                            ),
                                          );
                                        }
                                      } else {
                                        return Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CircularProgressIndicator(
                                                color: Color(0xff008c74),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: size.height / 40),
                            Container(
                              width: size.width / 6,
                              child: MaterialButton(
                                  child: Text("Main Menu"),
                                  onPressed: () async {
                                    Get.offAllNamed('/dashboard');
                                  },
                                  color: Color(0xff008c74),
                                  textColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 20),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(35))),
                            )
                          ],
                        ),
                      ),
                    ],
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
