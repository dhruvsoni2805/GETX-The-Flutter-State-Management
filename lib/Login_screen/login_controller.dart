import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_tut/homescreen.dart';
import 'package:http/http.dart';

class LoginScreenController extends GetxController {
  RxBool visiablePassword = true.obs;
  RxBool logindone = false.obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  passwordState() {
    visiablePassword.value = !visiablePassword.value;
  }

  loginApi() async {
    debugPrint("Login Api Call");

    try {
      final response = await post(Uri.parse("https://reqres.in/api/login"),
          body: {
            'email': emailController.value.text,
            'password': passwordController.value.text
          });
      var data = jsonDecode(response.body);
      debugPrint("Data is : ${data.toString()}");
      debugPrint("response code is : ${response.statusCode.toString()}");
      if (response.statusCode == 200) {
        Get.snackbar(
          "Login Successful",
          "",
          titleText: const Text(
            "Login Successful",
            style: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          messageText: RichText(
              text: TextSpan(
                  text: "Congrulation : ",
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                  children: [
                TextSpan(
                  text: emailController.value.text,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                )
              ])),
          animationDuration: const Duration(seconds: 1),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green[200],
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
        );
        Get.to(() => const HomeScreen());
      }
    } catch (exception) {
      Get.snackbar("Login Failed", exception.toString());
    }
  }
}
