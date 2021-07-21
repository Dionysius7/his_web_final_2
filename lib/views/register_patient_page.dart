import 'package:flutter/material.dart';
import 'package:his_web_final/controllers/notif_data_phr_controller.dart';
import 'package:his_web_final/controllers/qr_controller.dart';
import 'package:his_web_final/widgets/bottom_bar.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class RegisterPatientPage extends StatelessWidget {
  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final qrController = Get.put(QRController());
    final notifDataController = Get.put(NotifDataController());
    final TextEditingController phrIdController = TextEditingController();

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
                        child: Image.asset(
                          "assets/register_menu_icon.png",
                          height: size.height / 4,
                        ),
                      ),
                      SizedBox(
                        width: size.width / 20,
                      ),
                      Container(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Register Patient",
                                style: TextStyle(
                                  color: Color(0xff008c74),
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height / 20,
                                ),
                              ),
                              SizedBox(height: 25),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xff16c3b1),
                                    ),
                                    width: size.width / 5,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            cursorColor: Colors.white,
                                            style:
                                                TextStyle(color: Colors.white),
                                            controller: phrIdController,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Enter PHR ID',
                                              hintStyle: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Phr Id is required';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                            // color: Colors.red,
                                            border: Border(
                                              left: BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          child: InkWell(
                                            onTap: () async {
                                              await qrController
                                                  .scansQrCode(context);
                                              phrIdController.text =
                                                  qrController
                                                      .resultDataId.value;
                                            },
                                            child: Icon(
                                              Icons.qr_code,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 25),
                              Container(
                                width: size.width / 5,
                                child: MaterialButton(
                                    child: Text("REGISTER"),
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        EasyLoading.show(
                                            status: "Loading...",
                                            maskType:
                                                EasyLoadingMaskType.black);
                                        var resultMessage =
                                            await notifDataController
                                                .postPatientNotif(
                                                    phrIdController.text);
                                        if (resultMessage == "200") {
                                          EasyLoading.showSuccess(
                                              "Notification Sent");
                                        } else {
                                          EasyLoading.dismiss();
                                          Get.defaultDialog(
                                              title: "Response",
                                              content: Text(
                                                  resultMessage.toString()));
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
