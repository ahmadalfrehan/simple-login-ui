import 'package:get/get.dart';
import 'package:test/auth/getx/login-controller.dart';

class LoginBindings extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut(() => LoginController());
  }

}