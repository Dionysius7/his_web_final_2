import 'dart:convert';
import 'package:get/get.dart';
import 'package:his_web_final/const.dart';
import 'package:his_web_final/models/condition.dart';
import 'package:his_web_final/service.dart';
import 'package:get_storage/get_storage.dart';

class HospitalConditionController extends GetxController {
  var condition = <ConditionModel>[].obs;
  var service = new Service();
  var constant = new Const();
  GetStorage sessionData = GetStorage();

  //Create Condition
  Future<String> postConditionData(data, phrIds) async {
    var cModel = data;
    var response = await service.postConditionData(
        constant.hospitalConditionPost, jsonEncode(cModel.toJson()), phrIds);

    var result = jsonDecode(response.body);

    if (response.statusCode == 201) {
      return result['message'];
    } else {
      return result['error'].toString();
    }
  }

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
}
