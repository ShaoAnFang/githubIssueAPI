import 'package:get/get.dart';
import '../pages/MainPage.dart';
import 'PagesBind.dart';

part 'app_routes.dart';

class AppPages {
  static const initPage = AppRoutes.mainPage;
  static final routes = [
    GetPage(
      name: AppRoutes.mainPage,
      page: () => const MainPage(),
      binding: PagesBind(),
      children: [],
    ),
  ];
}
