import 'package:flutter/material.dart';
import 'package:his_web_final/widgets/bottom_bar.dart';
import 'package:get/get.dart';

class CreateConditionResponsePage extends StatelessWidget {
  const CreateConditionResponsePage({required this.responseStatus});
  final String responseStatus;
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
                        child: responseStatus == "success"
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/success_response.png",
                                    height: size.height / 8,
                                  ),
                                  SizedBox(height: size.height / 40),
                                  Text(
                                    "Condition Created",
                                    style: TextStyle(
                                      color: Color(0xff008c74),
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: size.height / 80),
                                  Text(
                                    "Thankyou",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: size.height / 40),
                                  Container(
                                    width: size.width / 6,
                                    child: MaterialButton(
                                        child: Text("Main Menu"),
                                        onPressed: () async {
                                          Get.offAllNamed('/dashboard');
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
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/error_response.png",
                                    height: size.height / 8,
                                  ),
                                  SizedBox(height: size.height / 40),
                                  Text(
                                    "PHR ID Not Found",
                                    style: TextStyle(
                                      color: Color(0xff008c74),
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: size.height / 80),
                                  Text(
                                    "Please try again",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: size.height / 40),
                                  Container(
                                    width: size.width / 6,
                                    child: MaterialButton(
                                        child: Text("Try Again"),
                                        onPressed: () async {
                                          Get.offAllNamed('/dashboard');
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
