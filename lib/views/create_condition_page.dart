import 'package:flutter/material.dart';
import 'package:his_web_final/controllers/hospital_condition_controller.dart';
import 'package:his_web_final/controllers/qr_controller.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:his_web_final/models/disease.dart';
import 'package:his_web_final/views/create_condition_response_page.dart';
import 'package:his_web_final/widgets/bottom_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateConditionPage extends StatelessWidget {
  final hospitalConditionController = Get.put(HospitalConditionController());
  final qrController = Get.put(QRController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormState>();

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
                  height: size.height / 1.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Create Condition",
                              style: TextStyle(
                                color: Color(0xff008c74),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: size.height / 40),
                            Container(
                              // color: Colors.blue,
                              padding: EdgeInsets.all(15),
                              width: size.width / 2.5,
                              height: size.height / 2.5,
                              child: Form(
                                key: _formKey,
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
                                                "Date: ",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(1),
                                                  color: Colors.grey[600],
                                                ),
                                                width: double.infinity,
                                                child: TextFormField(
                                                  enabled: false,
                                                  cursorColor: Colors.white,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                  controller:
                                                      hospitalConditionController
                                                          .dateController
                                                        ..text =
                                                            '${DateFormat("dd/MM/yyyy").format(DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()))}',
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: 'Enter Date',
                                                    hintStyle: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16),
                                                  ),
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Field Required';
                                                    }
                                                    return null;
                                                  },
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
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(1),
                                                  color: Color(0xff16c3b1),
                                                ),
                                                width: double.infinity,
                                                child: TextFormField(
                                                  cursorColor: Colors.white,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                  controller:
                                                      hospitalConditionController
                                                          .asserterController,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText:
                                                        'Enter Asserter Name',
                                                    hintStyle: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16),
                                                  ),
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Field Required';
                                                    }
                                                    return null;
                                                  },
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
                                                "PHR ID: ",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 15,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(1),
                                                  color: Color(0xff16c3b1),
                                                ),
                                                width: double.infinity,
                                                child: TextFormField(
                                                  cursorColor: Colors.white,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                  controller:
                                                      hospitalConditionController
                                                          .phrIdController,
                                                  decoration: InputDecoration(
                                                    suffixIcon: InkWell(
                                                      child: Icon(
                                                        Icons.qr_code,
                                                        color: Colors.white,
                                                      ),
                                                      onTap: () async {
                                                        await qrController
                                                            .scansQrCode(
                                                                context);
                                                        hospitalConditionController
                                                                .phrIdController
                                                                .text =
                                                            qrController
                                                                .resultDataId
                                                                .value;
                                                      },
                                                    ),
                                                    suffixStyle: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                    suffixIconConstraints:
                                                        BoxConstraints(
                                                      minWidth: 2,
                                                      minHeight: 2,
                                                    ),
                                                    border: InputBorder.none,
                                                    hintText: 'Enter PHR ID',
                                                    hintStyle: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16),
                                                  ),
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Field Required';
                                                    }
                                                    return null;
                                                  },
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
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 15),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            1),
                                                    color: Color(0xff16c3b1),
                                                  ),
                                                  width: double.infinity,
                                                  child: Obx(() =>
                                                      DropdownButton(
                                                        underline: Container(),
                                                        iconEnabledColor:
                                                            Colors.white,
                                                        isExpanded: true,
                                                        dropdownColor:
                                                            Color(0xff16c3b1),
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                        value:
                                                            hospitalConditionController
                                                                .selectedCategory
                                                                .value,
                                                        items:
                                                            hospitalConditionController
                                                                .categoryList
                                                                .map((val) {
                                                          return DropdownMenuItem(
                                                              value: val,
                                                              child: val ==
                                                                      "encounter-diagnosis"
                                                                  ? Text(
                                                                      "Encounter Diagnosis")
                                                                  : Text(
                                                                      "Problem List Item"));
                                                        }).toList(),
                                                        onChanged: (newValue) {
                                                          hospitalConditionController
                                                              .setSelectedCategory(
                                                                  newValue
                                                                      .toString());
                                                        },
                                                      ))),
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
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(1),
                                                  color: Color(0xff16c3b1),
                                                ),
                                                width: double.infinity,
                                                child: TypeAheadField(
                                                  hideOnEmpty: true,
                                                  textFieldConfiguration:
                                                      TextFieldConfiguration(
                                                    cursorColor: Colors.white,
                                                    controller:
                                                        hospitalConditionController
                                                            .diseaseNameController,
                                                    // autofocus: true,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                    ),
                                                    decoration: InputDecoration(
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 15),
                                                    ),
                                                  ),
                                                  debounceDuration: Duration(
                                                      milliseconds: 1000),
                                                  suggestionsCallback:
                                                      (query) async {
                                                    final result =
                                                        await hospitalConditionController
                                                            .getDiseaseData(
                                                                query);
                                                    hospitalConditionController
                                                        .disease.value = result;
                                                    return hospitalConditionController
                                                        .disease
                                                        .map((element) =>
                                                            element);
                                                  },
                                                  itemBuilder: (context,
                                                      DiseaseModel?
                                                          suggestion) {
                                                    return ListTile(
                                                      tileColor:
                                                          Color(0xff16c3b1),
                                                      title: Text(
                                                        suggestion!
                                                            .namaIcdIndo!,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    );
                                                  },
                                                  onSuggestionSelected:
                                                      (DiseaseModel?
                                                          suggestion) {
                                                    hospitalConditionController
                                                            .diseaseNameController
                                                            .text =
                                                        suggestion!
                                                            .namaIcdIndo!;

                                                    hospitalConditionController
                                                            .diseaseCodeController
                                                            .text =
                                                        suggestion.kodeIcd!;
                                                  },
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
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(1),
                                                  color: Colors.grey[600],
                                                ),
                                                width: double.infinity,
                                                child: TextFormField(
                                                  enabled: false,
                                                  cursorColor: Colors.white,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                  controller:
                                                      hospitalConditionController
                                                          .diseaseCodeController,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintStyle: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16),
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
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 15),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(1),
                                                  color: Color(0xff16c3b1),
                                                ),
                                                width: double.infinity,
                                                height: size.height / 10,
                                                child: TextFormField(
                                                  maxLines: null,
                                                  cursorColor: Colors.white,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                  controller:
                                                      hospitalConditionController
                                                          .diseaseEvidenceController,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText:
                                                        'Enter Disease Evidence',
                                                    hintStyle: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16),
                                                  ),
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Field Required';
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height / 40,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: size.height / 30),
                            Container(
                              width: size.width / 6,
                              child: MaterialButton(
                                  child: Text("Submit"),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      if (hospitalConditionController
                                              .diseaseNameController
                                              .text
                                              .isEmpty ||
                                          hospitalConditionController
                                              .diseaseCodeController
                                              .text
                                              .isEmpty) {
                                        EasyLoading.showToast(
                                            "No Disease Found! ",
                                            toastPosition:
                                                EasyLoadingToastPosition
                                                    .bottom);
                                      } else {
                                        EasyLoading.show(status: "Loading ...");
                                        String result =
                                            await hospitalConditionController
                                                .postConditionData();
                                        if (result == "201") {
                                          //Get to success page
                                          EasyLoading.dismiss();
                                          Get.off(CreateConditionResponsePage(
                                              responseStatus: "success"));
                                        } else {
                                          //Get to failed page
                                          EasyLoading.dismiss();
                                          Get.off(CreateConditionResponsePage(
                                              responseStatus: "failed"));
                                        }
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
