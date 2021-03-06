import 'dart:convert';

import 'package:get/get.dart';
import 'package:his_web_final/const.dart';
import 'package:his_web_final/models/notification.dart';
import 'package:his_web_final/service.dart';

class NotifDataController extends GetxController {
  var notification = <NotifModel>[].obs;
  var service = new Service();
  var constant = new Const();

  Future<String> postPatientNotif(phrIds) async {
    var response =
        await service.postNotifToPHR(constant.hospitalNotifPostPatient, phrIds);
    var result = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return response.statusCode.toString();
    } else {
      return result['message'];
    }
  }

  Future<String> postConditionNotif(phrIds) async {
    var response = await service.postNotifToPHR(
        constant.hospitalNotifPostCondition, phrIds);
    var result = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return response.statusCode.toString();
    } else {
      return result['message'];
    }
  }
}
