import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class TranslateLang extends StatefulWidget {
  const TranslateLang({super.key});

  @override
  State<TranslateLang> createState() => _TranslateLangState();
}

class _TranslateLangState extends State<TranslateLang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Translate Language"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        // alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          height: Get.height * 0.25,
          width: Get.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.deepPurple[100],
            //   gradient: LinearGradient(colors: [Colors.yellow, Colors.green]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'message'.tr,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              Text(
                'name'.tr,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Get.updateLocale(const Locale('gu', 'IN'));
                    },
                    child: const Text(
                      "Gujrati",
                      style: TextStyle(color: Colors.indigo),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Get.updateLocale(const Locale('en', 'US'));
                    },
                    child: const Text(
                      "English",
                      style: TextStyle(color: Colors.indigo),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Get.updateLocale(const Locale('hi', 'IN'));
                    },
                    child: const Text(
                      "Hindi",
                      style: TextStyle(color: Colors.indigo),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
