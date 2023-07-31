import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_tut/State_Management/counterController.dart';

class ThirdScreen extends StatefulWidget {
  final dynamic themevalue;

  const ThirdScreen({super.key, this.themevalue});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final CounterController themeController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    themeController.themeValue.value = widget.themevalue;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        title: const Text("Third Screen"),
        actions: [
          Builder(builder: (context) {
            return Obx(() => Column(
                  children: [
                    Switch(
                        value: themeController.themeValue.value,
                        onChanged: (val) {
                          debugPrint(
                              themeController.themeValue.value.toString());
                          themeController.changeTheme(val);
                          themeController.themeValue.value
                              ? Get.changeTheme(
                                  ThemeData.dark(useMaterial3: true))
                              : Get.changeTheme(
                                  ThemeData.light(useMaterial3: true));
                        }),
                    Text(themeController.themeValue.value
                        ? "Dark Mode On"
                        : "Light Mode On")
                  ],
                ));
          }),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                onTap: () {
                  Get.back();
                },
                title: const Text("Go Back Using GETX"),
                subtitle:
                    Text("Previous Screen Light Theme : ${widget.themevalue}"),
                enableFeedback: true,
                // splashColor: Colors.indigo[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
