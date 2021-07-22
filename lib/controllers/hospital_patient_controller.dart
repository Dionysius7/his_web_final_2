import 'dart:convert';

import 'package:get/get.dart';
import 'package:his_web_final/const.dart';
import 'package:his_web_final/service.dart';

class HospitalPatientController extends GetxController {
  var service = new Service();
  var constant = new Const();

  Future<String> searchPatient(phrIds) async {
    var response = await service.searchHospitalPatient(
        constant.hospitalPatientSearch, phrIds);
    var result = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return response.statusCode.toString();
    } else {
      return result['message'];
    }
  }
}
