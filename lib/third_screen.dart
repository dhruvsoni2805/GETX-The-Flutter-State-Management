import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThirdScreen extends StatefulWidget {
  bool lighttheme;
  ThirdScreen({super.key, required this.lighttheme});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text("Third Screen"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (widget.lighttheme == true) {
                    Get.changeTheme(ThemeData.light(useMaterial3: true));
                    widget.lighttheme = false;
                  } else {
                    Get.changeTheme(ThemeData.dark(useMaterial3: true));
                    widget.lighttheme = true;
                  }
                });
              },
              icon: widget.lighttheme != true
                  ? const Icon(Icons.dark_mode_outlined)
                  : const Icon(Icons.sunny))
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
                    Text("Previous Screen Light Theme : ${widget.lighttheme}"),
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
