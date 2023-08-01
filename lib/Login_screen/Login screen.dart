import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_tut/Login_screen/login_controller.dart';
import 'package:get_x_tut/homescreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginScreenController logincontroller =
      Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: const Text("Login Page"),
      ),*/
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login".toUpperCase(),
                style: const TextStyle(fontSize: 70),
              ),
              const SizedBox(
                height: 15,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Text(
                    "Enter Your Email",
                  ),
                ),
              ),
              TextFormField(
                controller: logincontroller.emailController.value,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "example@gmail.com",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Text(
                    "Enter Your Password",
                  ),
                ),
              ),
              Obx(
                () => TextFormField(
                  controller: logincontroller.passwordController.value,
                  obscureText: logincontroller.visiablePassword.value,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: "* * * * * * *",
                    suffixIcon: IconButton(
                        onPressed: () {
                          logincontroller.passwordState();
                        },
                        icon: Icon(logincontroller.visiablePassword.value
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    logincontroller.loginApi();
                    debugPrint(logincontroller.logindone.value.toString());
                    if (logincontroller.logindone.value == true) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[400],
                    fixedSize: Size(Get.width * 0.7, Get.height * 0.06),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
              const SizedBox(
                height: 20,
              ),
              const Text("email : eve.holt@reqres.in"),
              const SizedBox(
                height: 3,
              ),
              const Text("password : cityslicka"),
            ],
          ),
        ),
      )),
    );
  }
}
