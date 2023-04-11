import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test/home/model/users.dart';

class HomeController extends GetxController {
  RxList<User> users = <User>[].obs;

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

  getUsers() async {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
        headers: {'Authorization': 'Bearer token'});

    if (handleRemoteError(response.statusCode, 'message')) {
      final data = json.decode(response.body);
      for (var element in data) {
        if (element == null) {
          continue;
        }
        users.value.add(User.fromJson(element));
      }
    }

    log(users.value[0].address!.street.toString());
  }
}
