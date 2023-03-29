import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/auth/getx/login-controller.dart';

class Login extends GetView<LoginController> {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login page'),
            const SizedBox(height: 60),
            _textField('email', controller.emailController),
            const SizedBox(height: 20),
            _textField('password', controller.passwordController),
            const SizedBox(height: 20),
            Obx(
              () => controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : InkWell(
                      onTap: () {
                        controller.login();
                      },
                      child: Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.blue[500],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: const Text('Login'),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  _textField(String hint, TextEditingController textEditingController) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}
