// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'MainPageController.dart';

class MainPage extends GetView<MainPageController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Obx(() => IndexedStack(index: controller.tabBarIndex, children: controller.tabBarPages)),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xff283953),
          currentIndex: controller.tabBarIndex,
          selectedItemColor: const Color(0xffF6B91A),
          selectedLabelStyle: const TextStyle(
            fontSize: 0,
            fontWeight: FontWeight.w500,
            color: Color(0xffF6B91A),
          ),
          unselectedItemColor: Colors.grey,
          onTap: (int index) {
            controller.tabBarIndex = index;
            if (controller.tabBarPages[index] is SizedBox) {
              //print(tabBarPages);
              switch (controller.tabBarIndex) {
                case 1:
                  controller.tabBarPages.insert(controller.tabBarIndex, Container());
                  controller.tabBarPages.removeAt(controller.tabBarIndex + 1);
                  break;
                case 2:
                  controller.tabBarPages.insert(controller.tabBarIndex, Container());
                  controller.tabBarPages.removeAt(controller.tabBarIndex + 1);
                  break;
                case 3:
                  controller.tabBarPages.insert(controller.tabBarIndex, Container());
                  controller.tabBarPages.removeAt(controller.tabBarIndex + 1);
                  break;
                default:
                  print("Invalid choice");
                  break;
              }
              //print(pages);
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_rounded, size: 28),
              label: '行情', // controller.tabBarPagesTitle[0],
              activeIcon: Icon(Icons.bar_chart_rounded, size: 32, color: Colors.cyan),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.animation, size: 28),
              label: '', // controller.tabBarPagesTitle[1],
              activeIcon: Icon(Icons.animation, size: 32, color: Colors.cyan),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.subtitles_outlined, size: 28),
              label: '', //controller.tabBarPagesTitle[2],
              activeIcon: Icon(Icons.subtitles_outlined, size: 32, color: Colors.cyan),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, size: 28),
              activeIcon: Icon(Icons.person_outline, size: 32, color: Colors.cyan),
              label: '', //controller.tabBarPagesTitle[3],
            ),
          ],
        ),
      ),
      //正中間的tabbar
      // floatingActionButton: SizedBox.fromSize(
      //   size: Size(50, 105),
      //   child: Column(
      //     children: [
      //       SizedBox(width: 50, height: 55),
      //       SizedBox(
      //         width: 50,
      //         height: 50,
      //         child: Stack(
      //           children: [
      //             // Shimmer.fromColors(
      //             //   baseColor: const Color.fromRGBO(250, 222, 214, 1),
      //             //   highlightColor: const Color.fromRGBO(250, 243, 240, 1),
      //             //   loop: 3,
      //             // child:
      //             Container(
      //               decoration: BoxDecoration(
      //                 shape: BoxShape.circle,
      //                 color: const Color.fromRGBO(250, 222, 214, 1),
      //               ),
      //             ),
      //             // ),
      //             IconButton(
      //               onPressed: () {
      //                 controller.tabBarIndex = 2;
      //                 // if (controller.tabBarPages[2] is SizedBox) {
      //                 //   Get.put(sl<LiveListPageController>());
      //                 //   controller.tabBarPages.insert(controller.tabBarIndex, LiveListPage());
      //                 //   controller.tabBarPages.removeAt(controller.tabBarIndex + 1);
      //                 // }
      //               },
      //               icon: const Icon(Icons.videocam_outlined, color: Colors.white),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
