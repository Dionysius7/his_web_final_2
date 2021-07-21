import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tekartik_qrscan_flutter_web/qrscan_flutter_web.dart';

class QRController extends GetxController {
  RxString imgUrl = "".obs;
  RxBool isLoading = false.obs;
  RxString resultDataId = "".obs;

  // scanImage() async {
  //   isLoading.value = true;
  //   var options = ScanOptions(
  //     autoEnableFlash: false,
  //     android: AndroidOptions(
  //       aspectTolerance: 0,
  //       useAutoFocus: true,
  //     ),
  //   );
  //   ScanResult result = await BarcodeScanner.scan(options: options);
  //   resultDataId = result.rawContent.toString().obs;
  //   isLoading.value = false;
  // }

  // Future scanQrCode(context) async {
  //   if (kIsWeb) {
  //     var data = await scanQrCode(context);
  // resultDataId = data;
  //   } else {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('Only supported on the web')));
  //   }
  // }
  RxString qrCodeData = "".obs;

  Future scansQrCode(BuildContext context) async {
    if (GetPlatform.isWeb) {
      var title = "Scan Your QR Code";
      var data = await scanQrCode(context, title: title);
      resultDataId.value = data!;
      print("Data qr ->${resultDataId.value}");
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Only supported on the web')));
    }
  }
}
