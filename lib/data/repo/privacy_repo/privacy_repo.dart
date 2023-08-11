
import 'package:JillaOne/constants/method.dart';
import 'package:JillaOne/core/utils/url_container.dart';
import 'package:JillaOne/data/model/global/response_model/response_model.dart';
import 'package:JillaOne/data/services/api_service.dart';

class PrivacyRepo{

  ApiClient apiClient;
  PrivacyRepo({required this.apiClient});

  Future<dynamic>loadAboutData()async{
    String url='${UrlContainer.baseUrl}${UrlContainer.privacyPolicyEndPoint}';
    final response=await apiClient.request(url,Method.getMethod,null);
    return response;
  }

}