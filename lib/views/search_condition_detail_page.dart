import 'package:flutter/material.dart';
import 'package:his_web_final/controllers/hospital_condition_controller.dart';
import 'package:his_web_final/models/condition.dart';
import 'package:his_web_final/widgets/bottom_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SearchConditionDetailPage extends StatelessWidget {
  SearchConditionDetailPage({required this.conditionData});
  final ConditionModel conditionData;
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
                              "Condition Detail",
                              style: TextStyle(
                                color: Color(0xff008c74),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: size.height / 40),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              width: size.width / 2.5,
                              height: size.height / 4,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //Left side
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: size.width / 6,
                                        // color: Colors.red,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Hospital: ",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(1),
                                                color: Color(0xff16c3b1),
                                              ),
                                              width: double.infinity,
                                              child: Text(
                                                conditionData
                                                    .extension!.valueString
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: size.width / 6,
                                        // color: Colors.red,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Date: ",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(1),
                                                color: Color(0xff16c3b1),
                                              ),
                                              width: double.infinity,
                                              child: Text(
                                                '${DateFormat("dd/MM/yyyy").format(DateFormat("yyyy-MM-dd").parse(conditionData.onSetDateTime.toString()))}',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: size.width / 6,
                                        // color: Colors.red,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Asserter: ",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(1),
                                                color: Color(0xff16c3b1),
                                              ),
                                              width: double.infinity,
                                              child: Text(
                                                conditionData.asserter
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: size.width / 6,
                                        // color: Colors.red,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Category: ",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(1),
                                                color: Color(0xff16c3b1),
                                              ),
                                              width: double.infinity,
                                              child: Text(
                                                conditionData
                                                    .category!.coding!.display!
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    width: size.width / 40,
                                  ),

                                  //Right side
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: size.width / 6,
                                        // color: Colors.red,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Disease Name: ",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(1),
                                                color: Color(0xff16c3b1),
                                              ),
                                              width: double.infinity,
                                              child: Text(
                                                conditionData
                                                    .code!.coding!.display
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: size.width / 6,
                                        // color: Colors.red,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Disease Code: ",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(1),
                                                color: Color(0xff16c3b1),
                                              ),
                                              width: double.infinity,
                                              child: Text(
                                                conditionData
                                                    .code!.coding!.code!
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: size.width / 6,
                                        // color: Colors.red,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Evidence: ",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(1),
                                                color: Color(0xff16c3b1),
                                              ),
                                              width: double.infinity,
                                              height: size.height / 15,
                                              child: Text(
                                                conditionData.evidence!.details
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: size.height / 40),
                            Container(
                              width: size.width / 6,
                              child: MaterialButton(
                                  child: Text("Back to Condition List"),
                                  onPressed: () async {
                                    Get.back();
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
