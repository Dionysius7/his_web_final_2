import 'package:flutter/material.dart';
import 'package:his_web_final/controllers/hospital_condition_controller.dart';
import 'package:his_web_final/controllers/notif_data_phr_controller.dart';
import 'package:his_web_final/controllers/qr_controller.dart';
import 'package:his_web_final/views/register_patient_response_page.dart';
import 'package:his_web_final/views/search_condition_error_page.dart';
import 'package:his_web_final/views/search_condition_success_page.dart';
import 'package:his_web_final/widgets/bottom_bar.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SearchConditionPage extends StatelessWidget {
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final qrController = Get.put(QRController());
    final hospitalConditionController = Get.put(HospitalConditionController());
    final TextEditingController phrIdController = TextEditingController();

    return Scaffold(
      body: Container(
        width: size.width,
        color: Color(0xff008c74),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: size.width,
                  padding: EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      "<  Back",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                        child: Image.asset(
                          "assets/search_menu_icon.png",
                          height: size.height / 4,
                        ),
                      ),
                      SizedBox(
                        width: size.width / 20,
                      ),
                      Container(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Find Condition",
                                style: TextStyle(
                                  color: Color(0xff008c74),
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height / 20,
                                ),
                              ),
                              SizedBox(height: 25),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xff16c3b1),
                                    ),
                                    width: size.width / 5,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            cursorColor: Colors.white,
                                            style:
                                                TextStyle(color: Colors.white),
                                            controller: phrIdController,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Enter PHR ID',
                                              hintStyle: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Phr Id is required';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                            // color: Colors.red,
                                            border: Border(
                                              left: BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          child: InkWell(
                                            onTap: () async {
                                              await qrController
                                                  .scansQrCode(context);
                                              phrIdController.text =
                                                  qrController
                                                      .resultDataId.value;
                                            },
                                            child: Icon(
                                              Icons.qr_code,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 25),
                              Container(
                                width: size.width / 5,
                                child: MaterialButton(
                                    child: Text("SEARCH"),
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        EasyLoading.show(
                                            status: "Loading...",
                                            maskType:
                                                EasyLoadingMaskType.black);
                                        var resultMessage =
                                            await hospitalConditionController
                                                .getHospitalConditionData(
                                                    phrIdController.text);
                                        if (resultMessage == "200") {
                                          EasyLoading.dismiss();
                                          Get.off(SearchConditionSuccessPage(
                                            phrId: phrIdController.text,
                                          ));
                                        } else {
                                          EasyLoading.dismiss();
                                          Get.off(SearchConditionErrorPage());
                                        }
                                      }
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
