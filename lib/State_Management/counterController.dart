import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt count = 0.obs;
  RxDouble opacity = 0.0.obs;
  RxBool switchValue = false.obs;
  RxBool themeValue = false.obs;

  incrementCount() {
    count.value++;
    debugPrint(count.value.toString());
  }

  decrementCount() {
    count.value--;
    debugPrint(count.value.toString());
  }

  changeOpacity(double value) {
    opacity.value = value;
  }

  changeSwitch(bool value) {
    switchValue.value = value;
  }

  changeTheme(bool value) {
    themeValue.value = value;
  }
}
