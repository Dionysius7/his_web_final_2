class Const {
  //Hospital Name
  final String hospitalName = "Rumah Sakit Sobat Sehat Satu";

  //System Variable
  final String categorySystem =
      "http://terminology.hl7.org/CodeSystem/condition-category";
  final String codeCodingSystem =
      "https://www.who.int/classifications/icd/icdonlineversions/en";
  final String subjectReferenceSystem =
      "https://us-central1-phr-api.cloudfunctions.net/patient";
  final String extensionLocationSystem =
      "https://us-central1-phr-api.cloudfunctions.net/location";

  //Condition Const
  final String hospitalConditionPost =
      "https://us-central1-his-api-93700.cloudfunctions.net/condition/";
  final String hospitalConditionGet =
      "https://us-central1-his-api-93700.cloudfunctions.net/condition/";
  final String diseaseUrl =
      "https://us-central1-phr-api.cloudfunctions.net/disease/";

  //Notification Const
  final String hospitalNotifPostPatient =
      "https://us-central1-his-api-93700.cloudfunctions.net/notification/patient/";
  final String hospitalNotifPostCondition =
      "https://us-central1-his-api-93700.cloudfunctions.net/notification/condition/";

  //Patient Const
  final String hospitalPatientSearch =
      "https://us-central1-his-api-93700.cloudfunctions.net/patient/";
}
