import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  static bool handleRemoteError(int statusCode, String message) {
    if (statusCode >= 200 && statusCode < 300) {
      return true;
    } else if (statusCode == 401) {
      //throw RemoteException(ErrorCode.UNAUTHENTICATED, message);
    } else if (statusCode == 422) {
      // throw RemoteException(ErrorCode.WRONG_INPUT, message);
    } else if (statusCode == 403) {
      // throw RemoteException(ErrorCode.FORBIDDEN, message);
    } else if (statusCode == 404) {
      // throw RemoteException(ErrorCode.NOT_FOUND, message);
    } else if (statusCode >= 500) {
      // throw RemoteException(ErrorCode.SERVER_ERROR, message);
    }
    return false;
  }
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
    if(handleRemoteError(response.statusCode, response.body)){
    // Get.to(()=>)
    }
    isLoading.value = false;
    log(response.toString());
    log(response.statusCode.toString());
    log(response.body.toString());
  }
}
