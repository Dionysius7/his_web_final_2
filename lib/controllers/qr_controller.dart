import 'package:get/get.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

class QRController extends GetxController {
  RxString imgUrl = "".obs;
  RxBool isLoading = false.obs;
  RxString resultDataId = "".obs;

  scanImage() async {
    isLoading.value = true;
    var options = ScanOptions(
      autoEnableFlash: false,
      android: AndroidOptions(
        aspectTolerance: 0,
        useAutoFocus: true,
      ),
    );
    ScanResult result = await BarcodeScanner.scan(options: options);
    resultDataId = result.rawContent.toString().obs;
    isLoading.value = false;
  }
}
