import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;
  login() async {
    isLoading.value = true;
    print(json.encode({
      'username': emailController.text,
      'password': passwordController.text,
    }));

    final response = await http.post(
      Uri.parse('https://restful-booker.herokuapp.com/auth'),
      body: json.encode({
        'username': emailController.text,
        'password': passwordController.text,
      }),
    );
    isLoading.value = false;
    log(response.toString());
    log(response.statusCode.toString());
    log(response.body.toString());
  }
}
