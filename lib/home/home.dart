import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/home/getx/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: (){
          controller.getUsers();
        },
        child: Container(
          child: ListView.builder(
              itemCount: controller.users.value.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(controller.users.value[index].name.toString()),
                  leading: CircleAvatar(
                      child: Text(controller.users.value[index].id.toString())),
                );
              }),
        ),
      ),
    );
  }
}
