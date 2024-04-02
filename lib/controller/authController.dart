import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> python = TextEditingController().obs;
  Rx<TextEditingController> java = TextEditingController().obs;
  Rx<TextEditingController> c = TextEditingController().obs;
  Rx<TextEditingController> cpp = TextEditingController().obs;
}
