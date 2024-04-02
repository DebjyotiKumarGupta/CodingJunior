import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/view/authScreens/Widgets/authText.dart';
import 'package:myapp/view/authScreens/Widgets/customButton.dart';
import 'package:myapp/view/homescreens/homeScreen.dart';
import 'package:myapp/controller/authController.dart';
import 'package:myapp/view-models/localStorage.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var controller = Get.put(AuthController());
  final UserPreferences _userPreferences = UserPreferences();

  // @override
  // void dispose() {
  //   controller.emailController.value.dispose();
  //   controller.passwordController.value.dispose();
  //   Get.delete<AuthController>();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        scrolledUnderElevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome to Coding Junior",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
                // color: Colors.back,
                // fontFamily: inter,
              ),
            ),
            const Text(
              "Sign in with your name and password",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                // color: grey,
                // fontFamily: inter,
              ),
            ),
            AuthTextFieldWidget(
              label: "FirstName",
              hintText: "Debjyoti",
              keyboardType: TextInputType.emailAddress,
              passwordVisible: false,
              iconVisible: false,
              controller: controller.nameController.value,
            ),
            AuthTextFieldWidget(
              label: "Password",
              hintText: "********",
              keyboardType: TextInputType.text,
              passwordVisible: true,
              iconVisible: true,
              controller: controller.passwordController.value,
            ),
            const SizedBox(
              height: 15,
            ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => const ForgotPasswordScreen()));
            //   },
            //   child: const Text(
            //     "Forgot password?",
            //     style: TextStyle(
            //         fontSize: 10,
            //         fontWeight: FontWeight.w400,
            //         color: grey,
            //         fontFamily: inter),
            //   ),
            // ),
            // Obx(
            //   () => (controller.loading.value == true)
            //       ? Center(
            //           child: CircularProgressIndicator(color: Colors.red),
            //         )
            //       :

            CustomAuthButton(
                context: context,
                ontap: () async {
                  if (controller.passwordController.value.text != "" &&
                      controller.nameController.value.text != "") {
                    print("Saving the values");
                    _userPreferences
                        .saveUserName(controller.nameController.value.text)
                        .then((value) {
                      print(value);
                      _userPreferences
                          .saveUserPassword(
                              controller.passwordController.value.text)
                          .then((value) {
                        print(value);
                        Get.to(
                          HomeScreen(),
                        );
                      });
                    });

                    // await controller.postUser(context);
                    // controller.loginUser(
                    //     context,
                    //     controller.emailController.value.text,
                    //     controller.passwordController.value.text);
                  } else {
                    Get.snackbar("Error", "Enter All the fields");
                  }
                },
                buttonText: "Continue"),

            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
