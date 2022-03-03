import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../page/home.dart';
import '../page/controller.dart';
import '../page/add_device.dart';
import '../page/login.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Home;

  static final routes = [
    GetPage(
      name: AppRoutes.Home,
      page: () => HomeView(),
      children: [
        GetPage(
          name: AppRoutes.Detail,
          page: () => Controller(),
        ),
      ],
    ),
  ];
}