import 'package:http/http.dart' as http;

class Service {
  final Map<String, String> contentType = {"Content-Type": "application/json"};

  //Condition Related API Service
  Future getAllConditionData(url, phrId) {
    var finalUrl = Uri.parse(url + phrId);
    return http.get(finalUrl);
  }

  Future postConditionData(url, body, phrId) {
    var finalUrl = Uri.parse(url + phrId);
    return http.post(finalUrl, headers: contentType, body: body);
  }

  Future getQueryDisease(url, query) {
    var finalUrl = Uri.parse('$url$query');
    print(finalUrl);
    return http.get(finalUrl);
  }

  //Notification Related API Service
  Future postNotifToPHR(url, phrId) {
    var finalUrl = Uri.parse(url + phrId);
    return http.post(finalUrl, headers: contentType);
  }

  //Patient Related API Service
  Future searchHospitalPatient(url, phrId) {
    var finalUrl = Uri.parse(url + phrId);
    return http.get(finalUrl);
  }
}
