import 'package:github_api/pages/HomePage/repositories/HomePageRepositories.dart';
import '../../../network/api_service.dart';

class HomePageRepositoryImpl implements HomePageRepository {
  final ApiService api = ApiService();

  @override
  Future getRepoIssues() async {
    return await api.getRepoIssues();
  }

}
