import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../page/home.dart';
import '../page/controller.dart';
import '../page/add_device1.dart';
import '../page/add_device2.dart';
import '../page/add_device3.dart';
import '../page/add_device4.dart';
import '../page/add_device5.dart';
import '../page/add_device6.dart';
import '../page/wifi.dart';

part 'app_routes.dart';

class AppPages {

  static const INITIAL = AppRoutes.WiFi;

  static final routes = [
    GetPage(
      name: AppRoutes.WiFi,
      page: () => Add_WiFi(),
      children: [
        GetPage(
          name: AppRoutes.Home,
          page: () => HomeView(),
          children: [
            GetPage(
              name: AppRoutes.Detail,
              page: () => Controller(),
            ),
            GetPage(
              name: AppRoutes.Add1,
              page: () => Add_Device_1(),
              children: [
                GetPage(
                  name: AppRoutes.Add2,
                  page: () => Add_Device_2(),
                  children: [
                    GetPage(
                      name: AppRoutes.Add3,
                      page: () => Model_Select_info(),
                      children: [
                        GetPage(
                          name: AppRoutes.Add4,
                          page: () => Add_Device_4(),
                          children: [
                            GetPage(
                              name: AppRoutes.Add5,
                              page: () => Add_Device_5(),
                              children: [
                                GetPage(
                                  name: AppRoutes.Add6,
                                  page: () => Add_Device_6(),
                                ),
                              ]
                            ),
                          ]
                        ),
                      ]
                    ),
                  ]
                ),
              ]
            ),
          ],
        ),
      ],
    ),
  ];
}