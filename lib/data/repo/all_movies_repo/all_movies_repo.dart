import 'package:JillaOne/constants/method.dart';
import 'package:JillaOne/core/utils/url_container.dart';
import 'package:JillaOne/data/services/api_service.dart';

class AllMoviesRepo {
  ApiClient apiClient;

  AllMoviesRepo({required this.apiClient});

  Future<dynamic>getMovie(int page)async{
    String url='${UrlContainer.baseUrl}api/movies?page=$page';
    final response=await apiClient.request(url, Method.getMethod, null);
    return response;
  }


}
