import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/auth/getx/login-bindings.dart';
import 'package:test/auth/login/login.dart';
import 'package:test/routes/app-routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: LoginBindings(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.LOGIN,
      getPages: [
        GetPage(
          name: AppRoutes.LOGIN,
          page: () => const Login(),
          binding: LoginBindings(),
        ),
      ],
    );
  }
}
