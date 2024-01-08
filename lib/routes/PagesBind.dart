import 'package:get/get.dart';
import 'package:github_api/pages/IssueDetailPage/repositories/IssueDetailPageRepositoriesImpl.dart';
import '../pages/HomePage/HomePageController.dart';
import '../pages/HomePage/repositories/HomePageRepositoriesImpl.dart';
import '../pages/IssueDetailPage/IssueDetailPageController.dart';
import '../pages/MainPageController.dart';

class PagesBind implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainPageController>(() => MainPageController());
    Get.lazyPut(() => HomePageController(homePageRepository: HomePageRepositoryImpl()));

    Get.lazyPut(() => IssueDetailPageController(issueDetailPageRepository: IssueDetailPageRepositoryImpl()));
    
  }
}
