import 'package:flutter/material.dart';
import 'package:his_web_final/views/menu_page.dart';
import 'package:his_web_final/widgets/bottom_bar.dart';
import 'package:get/get.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xff008c74),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rumah Sakit \nSobat Sehat Satu",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width / 40,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height / 80,
                      ),
                      Text(
                        "Kesehatan anda adalah prioritas \nutama kami, rumah sakit sobat \nsehat satu saling membantu ",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: size.width / 80,
                        ),
                      ),
                      SizedBox(
                        height: size.height / 80,
                      ),
                      MaterialButton(
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.width / 80),
                          ),
                          onPressed: () {
                            Get.to(MenuPage());
                          },
                          color: Colors.white,
                          textColor: Color(0xff008c74),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10)))
                    ],
                  ),
                  SizedBox(
                    width: size.width / 10,
                  ),
                  Image.asset(
                    "assets/landing_page.png",
                    width: size.width / 4,
                  ),
                ],
              ),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
