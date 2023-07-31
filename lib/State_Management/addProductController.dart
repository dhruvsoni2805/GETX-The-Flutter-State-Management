import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  RxList<dynamic> addProduct = [].obs;
  RxList<String> productNames = [
    'TechGizmo',
    'EcoTrend',
    'LifeTech',
    'PowerX',
    'SuperNova',
    'HyperDrive',
    'ProFlex',
  ].obs;

  addProductNameList(String value) {
    addProduct.add(value);
    debugPrint("add product");

    debugPrint(addProduct.toString());
  }

  removeProductNameList(String value) {
    addProduct.remove(value);
    debugPrint("remove product");
    debugPrint(addProduct.string);
  }
}
