import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../entityies/issue_model.dart';
import 'repositories/HomePageRepositories.dart';

class HomePageController extends GetxController with SingleGetTickerProviderMixin, WidgetsBindingObserver {
  HomePageController({required this.homePageRepository});

  final HomePageRepository homePageRepository;

  final _isLoading = true.obs;
  set isLoading(value) => _isLoading.value = value;
  get isLoading => _isLoading.value;

  final _issueModel = <IssueModel>[].obs;
  List<IssueModel> get issueModel => _issueModel.toList();

  @override
  void onInit() async {
    WidgetsBinding.instance.addObserver(this);
    await fetchData();
    super.onInit();
  }

  @override
  onClose() {
    super.onClose();
  }

  fetchData() async {
    isLoading = true;
    final dataList = await homePageRepository.getRepoIssues();
    log(dataList.length.toString());

    _issueModel.addAll(dataList);
    isLoading = false;
  }
}
