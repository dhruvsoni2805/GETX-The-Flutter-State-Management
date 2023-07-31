import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FourthScreen extends StatefulWidget {
  final dynamic name;

  const FourthScreen({super.key, this.name});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text("Fourth Screen Data"),
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
                subtitle: Text(Get.arguments[0]),
                enableFeedback: true,
                // splashColor: Colors.indigo[700],
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                onTap: () {
                  Get.back();
                },
                title: const Text("The Argument index is 1"),
                subtitle: Text(Get.arguments[1]),
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
