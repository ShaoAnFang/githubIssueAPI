import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_api/routes/PagesBind.dart';
import '../../style/color.dart';
import '../IssueDetailPage/IssueDetailPage.dart';
import 'HomePageController.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBG,
      appBar: AppBar(
        backgroundColor: primaryBG,
        title: const Text('Repo:flutter/Flutter', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(
          () {
            if (controller.isLoading) return const CircularProgressIndicator();
            return ListView.builder(
              itemCount: controller.issueModel.length,
              itemBuilder: (context, index) {
                final issueData = controller.issueModel[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(() => const IssueDetailPage(), arguments: {"id": issueData.number.toString()}, binding: PagesBind());
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.circle_outlined, color: Colors.green),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(issueData.title ?? " ", style: const TextStyle(fontSize: 18, color: Colors.white), overflow: TextOverflow.ellipsis),
                              Text("#${issueData.number} ${issueData.state} by ${issueData.user?.login}", style: const TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
