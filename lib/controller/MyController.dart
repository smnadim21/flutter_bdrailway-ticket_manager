import 'package:get/get.dart';

class MyController extends GetxController {
  var counter = 0.obs;
 // int get abc => counter;

  void incrementCounter() {
    counter++;
  }
}
