import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_tut/State_Management/addProductController.dart';
import 'package:get_x_tut/State_Management/counterController.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final CounterController controller = Get.put(CounterController());
  final AddProductController productAddController =
      Get.put(AddProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text("Counter"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              //Counter add and minus
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                alignment: Alignment.center,
                // height: Get.height * 0.35,
                decoration: BoxDecoration(
                    // color: Colors.blueAccent[100],
                    border: Border.all(
                      color: controller.themeValue.value
                          ? Colors.white
                          : Colors.black,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Obx(() {
                      return Text(
                        controller.count.toString(),
                        style: const TextStyle(
                          fontSize: 70,
                        ),
                      );
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              controller.decrementCount();
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 10,
                                // backgroundColor: Colors.red[500],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                fixedSize:
                                    Size(Get.width * 0.4, Get.height * 0.1)),
                            child: const Icon(
                              Icons.remove,
                            )),
                        ElevatedButton(
                            onPressed: () {
                              controller.incrementCount();
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 10,
                                // backgroundColor: Colors.green[500],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                fixedSize:
                                    Size(Get.width * 0.4, Get.height * 0.1)),
                            child: const Icon(
                              Icons.add,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //Slider
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(10),
                  // height: Get.height * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.brown.withOpacity(controller.opacity.value),
                      border: Border.all(
                        color: controller.themeValue.value
                            ? Colors.white
                            : Colors.black,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    children: [
                      Text(
                        controller.opacity.value.toStringAsFixed(2),
                        style: const TextStyle(fontSize: 30),
                      ),
                      Slider(
                          value: controller.opacity.value,
                          onChanged: (value) {
                            controller.changeOpacity(value);
                            debugPrint(value.toString());
                          }),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //switch
              Obx(() => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: controller.switchValue.value
                          ? Colors.green[300]
                          : Colors.red[300],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Switch value is  : ${(controller.switchValue.value)}",
                          style: const TextStyle(fontSize: 20),
                        ),
                        Switch(
                            value: controller.switchValue.value,
                            onChanged: (val) {
                              controller.switchValue(val);
                            })
                      ],
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                // height: 150,
                child: Obx(
                  () => ListView.builder(
                    // itemCount: productNames.length,
                    itemCount: productAddController.productNames.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 10,
                        child: ListTile(
                          onTap: () {
                            if (productAddController.addProduct.contains(
                                productAddController.productNames[index]
                                    .toString())) {
                              productAddController.removeProductNameList(
                                  productAddController.productNames[index]
                                      .toString());
                              // debugPrint(
                              //     "remove product is : ${productAddController.addProduct[index]}");
                            } else {
                              productAddController.addProductNameList(
                                  productAddController.productNames[index]
                                      .toString());
                              // debugPrint(
                              //     "add product is : ${productAddController.addProduct[index]}");
                            }
                            // setState(() {});
                            // addProduct.add(productNames[index].toString());
                          },
                          title: Text(
                              "${index + 1}). ${productAddController.productNames[index].toString()}"),
                          trailing: Obx(
                            () => Icon(
                              Icons.favorite,
                              color: productAddController.addProduct.contains(
                                      productAddController.productNames[index]
                                          .toString())
                                  ? Colors.red
                                  : Colors.white,
                            ),
                          ),
                        ),

                        // Container(
                        //     padding: const EdgeInsets.symmetric(horizontal: 20),
                        //     height: 50,
                        //     // color: Colors.blueGrey,
                        //     alignment: Alignment.center,
                        //     child: Row(
                        //       children: [
                        //         Text((index + 1).toString()),
                        //
                        //       ],
                        //     )),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
