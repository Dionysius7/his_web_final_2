import 'package:flutter/material.dart';
import 'package:his_web_final/views/create_condition_page.dart';
import 'package:his_web_final/views/dashboard_page.dart';
import 'package:his_web_final/views/landing_page.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:his_web_final/views/menu_page.dart';
import 'package:his_web_final/views/register_patient_page.dart';
import 'package:his_web_final/views/request_condition_page.dart';
import 'package:his_web_final/views/search_condition_page.dart';
import 'package:his_web_final/views/search_patient_page.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPage(),
      builder: EasyLoading.init(),
      getPages: [
        GetPage(name: "/", page: () => LandingPage()),
        GetPage(name: "/menu", page: () => MenuPage()),
        GetPage(name: "/menu/register", page: () => RegisterPatientPage()),
        GetPage(name: "/menu/search", page: () => SearchPatientPage()),
        GetPage(name: "/dashboard", page: () => DashboardPage()),
        GetPage(name: "/dashboard/request", page: () => RequestConditionPage()),
        GetPage(name: "/dashboard/find", page: () => SearchConditionPage()),
        GetPage(name: "/dashboard/create", page: () => CreateConditionPage()),
      ],
    );
  }
}
