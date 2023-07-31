import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_tut/image_picker/image_picker_controller.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  final ImagePickerController imagepickercontroller =
      Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text("Second Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Obx(
          () => Column(
            children: [
              Visibility(
                // visible: true,
                visible: !imagepickercontroller.showimage.value,
                child: const CircleAvatar(
                  radius: 150,
                  backgroundImage: NetworkImage(
                    "https://t4.ftcdn.net/jpg/04/00/24/31/240_F_400243185_BOxON3h9avMUX10RsDkt3pJ8iQx72kS3.jpg",
                  ),
                  // FileImage(File("assets/images/no_image.jpg")),
                ),
              ),
              Visibility(
                visible: imagepickercontroller.showimage.value,
                child: CircleAvatar(
                  radius: 150,
                  backgroundImage: imagepickercontroller.imagePath.isNotEmpty
                      ? FileImage(
                          File(imagepickercontroller.imagePath.toString()))
                      : null,
                  // FileImage(File("assets/images/no_image.jpg")),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        imagepickercontroller.getCameraImage();
                      },
                      child: const Text("Camera Image")),
                  OutlinedButton(
                      onPressed: () {
                        imagepickercontroller.getGalleryImage();
                      },
                      child: const Text("Gallery Image")),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  onTap: () {
                    Get.back();
                  },
                  title: const Text("Go Back Using GETX"),
                  enableFeedback: true,
                  // splashColor: Colors.indigo[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
