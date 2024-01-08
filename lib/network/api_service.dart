import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:github_api/entityies/issue_model.dart';
import '../components/TextToast.dart';
import '../entityies/issue_comment_model.dart';
import 'http_util.dart';

class ApiService {
  final HttpUtil http = HttpUtil();

  Future getRepoIssues() async {
    final response = await http.get('/repos/flutter/Flutter/issues');
    if (response is DioException) {
      log("getKLine error");
      log(response.toString());
      TextToast.show("statusCode: ${response.response?.statusCode}");
      return false;
    }

    return List<IssueModel>.generate(response.data.length, (index) => IssueModel.fromJson(response.data[index]));
  }

  Future getIssueComments(String id) async {
    final response = await http.get('/repos/flutter/Flutter/issues/$id/comments');
    if (response is DioException) {
      log("get Issue Comments error");
      log(response.toString());
      TextToast.show("statusCode: ${response.response?.statusCode}");
      return false;
    }
    return List<IssueCommentModel>.generate(response.data.length, (index) => IssueCommentModel.fromJson(response.data[index]));
  }
}
