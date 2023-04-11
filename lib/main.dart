import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/auth/getx/login-bindings.dart';
import 'package:test/auth/login/login.dart';
import 'package:test/home/getx/home-bindings.dart';
import 'package:test/home/home.dart';
import 'package:test/routes/app-routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: HomeBindings(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.HOME,
      getPages: [
        GetPage(
          name: AppRoutes.LOGIN,
          page: () => const Login(),
          binding: LoginBindings(),
        ),
        GetPage(
          name: AppRoutes.HOME,
          page: () => const HomeScreen(),
          binding: HomeBindings(),
        ),
      ],
    );
  }
}
