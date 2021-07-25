import 'dart:convert';
import 'package:get/get.dart';
import 'package:his_web_final/const.dart';
import 'package:his_web_final/models/condition.dart';
import 'package:his_web_final/models/disease.dart';
import 'package:his_web_final/service.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class HospitalConditionController extends GetxController {
  var condition = <ConditionModel>[].obs;
  RxList<DiseaseModel> disease = <DiseaseModel>[].obs;
  var service = new Service();
  var constant = new Const();
  GetStorage sessionData = GetStorage();
  RxString selectedCategory = "encounter-diagnosis".obs;
  List categoryList = ["encounter-diagnosis", "problem-list-item"];

  TextEditingController diseaseNameController = TextEditingController();
  TextEditingController diseaseCodeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController asserterController = TextEditingController();
  TextEditingController phrIdController = TextEditingController();
  TextEditingController diseaseEvidenceController = TextEditingController();

  void setSelectedCategory(String newValue) {
    selectedCategory.value = newValue;
  }

  //Create Condition
  Future<String> postConditionData() async {
    var categoryDisplay = "";
    if (selectedCategory == "encounter-diagnosis") {
      categoryDisplay = "Encounter Diagnosis";
    } else {
      categoryDisplay = "Problem List Item";
    }

    ConditionModel cModel = ConditionModel(
      resourceType: "Condition",
      category: Category(
          coding: Coding(
              code: selectedCategory.value,
              system: constant.categorySystem,
              display: categoryDisplay)),
      code: Code(
          coding: Coding(
        code: diseaseCodeController.text,
        system: constant.codeCodingSystem,
        display: diseaseNameController.text,
      )),
      subject: Subject(
          reference: constant.subjectReferenceSystem,
          identifier: phrIdController.text),
      onSetDateTime: DateTime.now(),
      evidence: Evidence(details: diseaseEvidenceController.text),
      asserter: asserterController.text,
      extension: Extension(
          url: constant.extensionLocationSystem,
          valueString: constant.hospitalName),
    );

    try {
      var response = await service.postConditionData(
          constant.hospitalConditionPost,
          jsonEncode(cModel.toJson()),
          phrIdController.text);
      return response.statusCode.toString();
    } catch (e) {
      print("Post Data Error -> $e");
      return e.toString();
    }
  }

  // Future<String> postConditionData(data, phrIds) async {
  //   var cModel = data;
  //   var response = await service.postConditionData(
  //       constant.hospitalConditionPost, jsonEncode(cModel.toJson()), phrIds);

  //   var result = jsonDecode(response.body);

  //   if (response.statusCode == 201) {
  //     return result['message'];
  //   } else {
  //     return result['error'].toString();
  //   }
  // }

  //Search Patient Condition in Hospital Data
  Future<String> getHospitalConditionData(phrIds) async {
    var response = await service.getAllConditionData(
        constant.hospitalConditionGet, phrIds);
    if (response.statusCode == 200) {
      var conditionData = conditionModelFromJson(response.body);
      condition.value = conditionData;
      return response.statusCode.toString();
    } else {
      print(response.statusCode);
      return response.statusCode.toString();
    }
  }

  //Search Disease in Hospital Data
  Future<List<DiseaseModel>> getDiseaseData(String query) async {
    try {
      var response = await service.getQueryDisease(constant.diseaseUrl, query);
      if (response.statusCode == 200) {
        return diseaseModelFromJson(response.body);
      } else {
        print(response.statusCode);
        print(response.body);
        return diseaseModelFromJson(response.body);
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
