import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_tut/State_Management/counterController.dart';
import 'package:get_x_tut/State_Management/counterScreen.dart';
import 'package:get_x_tut/change_lang.dart';
import 'package:get_x_tut/image_picker/image_picker.dart';
import 'package:get_x_tut/third_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CounterController switchcontroller = Get.put(CounterController());
  var lighttheme = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Get X",
          style: TextStyle(fontSize: 30),
        ),
        toolbarHeight: 70,
        actions: [
          Builder(builder: (context) {
            return Obx(() => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Switch(
                        value: switchcontroller.themeValue.value,
                        onChanged: (val) {
                          switchcontroller.changeTheme(val);
                          switchcontroller.themeValue.value
                              ? Get.changeTheme(
                                  ThemeData.dark(useMaterial3: true))
                              : Get.changeTheme(
                                  ThemeData.light(useMaterial3: true));
                        }),
                    Text(switchcontroller.themeValue.value
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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Getx Counter Screen
              Card(
                // color: Colors.indigo[100],
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  onTap: () {
                    Get.to(() => const CounterScreen());
                  },
                  title: const Text("GetX Counter Screen"),
                  enableFeedback: true,
                  // splashColor: Colors.indigo[700],
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              //Getx Snackbar
              Card(
                // color: Colors.indigo[100],
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child:
                    // Obx(
                    //   () =>
                    ListTile(
                  onTap: () {
                    Get.snackbar(
                      "message",
                      'dara',
                      titleText: const Text("Getx Snackbar"),
                      messageText: Obx(
                        () => Text(
                            "Theme : ${switchcontroller.themeValue.value}"),
                      ),
                      // backgroundColor: Colors.green[100],
                      mainButton: TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("Click Here")),
                      borderRadius: 10,
                      snackPosition: SnackPosition.TOP,
                      animationDuration: const Duration(seconds: 1),
                    );
                  },
                  title: const Text("GetX Snack Bar"),
                  enableFeedback: true,
                  // splashColor: Colors.indigo[700],
                ),
              ),
              // ),
              const SizedBox(
                height: 7,
              ),
              // Getx Dailog Box
              Card(
                // color: Colors.indigo[100],
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  onTap: () {
                    Get.defaultDialog(
                        title: "GETX Dailog",
                        // middleText: "Delete Data",
                        content: Obx(
                          () => Text(
                              "Theme : ${switchcontroller.themeValue.value}"),
                        ),
                        cancel: TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text("Cancle")));
                  },
                  title: const Text("GetX Dailog Box"),
                  enableFeedback: true,
                  // splashColor: Colors.indigo[700],
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              //Getx Bottom Sheet
              Card(
                // color: Colors.indigo[100],
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  onTap: () {
                    Get.bottomSheet(
                      elevation: 10,
                      enableDrag: true,
                      backgroundColor: switchcontroller.themeValue.value
                          ? Colors.black
                          : Colors.white,
                      Container(
                        // color: Colors.red,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        height: 300,
                        child: const Column(
                          children: [
                            Text(
                              "GETX Bottom Sheet",
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider(
                              endIndent: 150,
                              indent: 150,
                              thickness: 3,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                                "This is Content of GETX Bottom Sheet, Which is allow inlt Three Lines"),
                          ],
                        ),
                      ),
                    );
                  },
                  title: const Text("GetX Bottom Sheet"),
                  enableFeedback: true,
                  // splashColor: Colors.indigo[700],
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              //Get Go One Screen To Another Screen
              Card(
                // color: Colors.indigo[100],
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  onTap: () {
                    Get.to(() => const ImagePickerScreen());
                  },
                  title: const Text("GetX Open Screen Without Pass Data"),
                  enableFeedback: true,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              //Get Go One Screen To Another Screen Using Routes
              Card(
                // color: Colors.indigo[100],
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  onTap: () {
                    // Get.to(const SecondScreen());
                    Get.toNamed('/ImagePickerScreen');
                  },
                  title: const Text(
                      "GetX Open Screen Using Routes Without Pass Data"),
                  enableFeedback: true,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              //Get Go One Screen To Another Screen & Data Pass
              Card(
                // color: Colors.indigo[100],
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  onTap: () {
                    Get.to(() => Obx(() => ThirdScreen(
                          themevalue: switchcontroller.themeValue.value,
                        )));
                  },
                  title: const Text("GetX Open Screen With Pass Data"),
                  subtitle: Obx(
                    () => Text(
                        "Previous Screen Light Theme : ${switchcontroller.themeValue.value}"),
                  ),
                  enableFeedback: true,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              //Get Go One Screen To Another Screen & Data Pass Using Routes
              Card(
                // color: Colors.indigo[100],
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  onTap: () {
                    // Get.to(FourthScreen());
                    Get.toNamed('/FourthScreen', arguments: [
                      'GetX Route Example',
                      'My Name is Dhruv Soni'
                    ]);
                  },
                  title: const Text("GetX Open Screen With Pass Data"),
                  enableFeedback: true,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              //Getx Auto Change Language
              Card(
                // color: Colors.indigo[100],
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  onTap: () {
                    Get.to(() => const TranslateLang());
                  },
                  title: const Text("Auto Change Language"),
                  enableFeedback: true,
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
