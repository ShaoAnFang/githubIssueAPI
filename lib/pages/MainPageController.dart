import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'HomePage/HomePage.dart';
import 'HomePage/HomePageController.dart';
import 'HomePage/repositories/HomePageRepositoriesImpl.dart';

class MainPageController extends GetxController {
  final _tabBarIndex = 0.obs;
  set tabBarIndex(value) => _tabBarIndex.value = value;
  get tabBarIndex => _tabBarIndex.value;

  final tabBarPagesTitle = ["Tab0", "Tab1", "Tab2", "Tab3"];

  List<Widget> tabBarPages = [];

  @override
  void onInit() {
    Get.put(() => HomePageController(homePageRepository: HomePageRepositoryImpl()));
    tabBarPages = [
      const HomePage(),
      const SizedBox(),
      const SizedBox(),
      const SizedBox(),
    ];
    super.onInit();
  }
}
