import 'dart:convert';
import 'package:get/get.dart';
import 'package:JillaOne/core/helper/shared_pref_helper.dart';
import 'package:JillaOne/data/model/global/response_model/response_model.dart';
import 'package:JillaOne/data/repo/auth/general_setting_repo.dart';
import 'package:JillaOne/view/components/show_custom_snackbar.dart';

import '../../constants/my_strings.dart';
import '../../core/helper/messages.dart';
import '../../core/route/route.dart';
import '../model/general_setting/general_settings_response_model.dart';
import '../repo/splash/splash_repo.dart';
import 'localization/localization_controller.dart';

class SplashController extends GetxController implements GetxService {

  SplashRepo splashRepo;
  GeneralSettingRepo gsRepo;
  LocalizationController localizationController;
  bool isLoading = true;
  String imageUrl = '';

  SplashController({required this.splashRepo, required this.gsRepo,required this.localizationController});

  gotoNextPage() async {

    await loadLanguage();

    GeneralSettingsResponseModel model = await gsRepo.getGeneralSetting();
    if (model.data == null) {
      return;
    }
    isLoading = false;
    update();
    bool isRemember = splashRepo.apiClient.sharedPreferences.getBool(SharedPreferenceHelper.rememberMeKey) ?? false;
    if (isRemember) {
      Future.delayed(const Duration(seconds: 1), () {
        Get.offAndToNamed(RouteHelper.homeScreen);
      });
    } else {
      ResponseModel responseModel = await splashRepo.getOnboardingData();
      if (responseModel.statusCode == 200) {
        Future.delayed(const Duration(seconds: 1), () {
          Get.offAndToNamed(RouteHelper.onboardScreen,arguments: responseModel);
        });
      } else {
        CustomSnackbar.showCustomSnackbar(
            errorList: [responseModel.message], msg: [], isError: true);
      }
    }
  }


  Future<bool> initSharedData() {
    if(!gsRepo.apiClient.sharedPreferences.containsKey(SharedPreferenceHelper.countryCode)) {
      return gsRepo.apiClient.sharedPreferences.setString(SharedPreferenceHelper.countryCode, MyStrings.myLanguages[0].countryCode);
    }
    if(!gsRepo.apiClient.sharedPreferences.containsKey(SharedPreferenceHelper.langCode)) {
      return gsRepo.apiClient.sharedPreferences.setString(SharedPreferenceHelper.langCode, MyStrings.myLanguages[0].languageCode);
    }
    return Future.value(true);
  }
  Future<void>loadLanguage()async{
    localizationController.loadCurrentLanguage();
    String languageCode = localizationController.locale.languageCode;
    ResponseModel response = await gsRepo.getLanguage(languageCode);
    if(response.statusCode == 200){
      try{
        Map<String,Map<String,String>> language = {};
        var resJson = jsonDecode(response.responseJson);
        saveLanguageList(response.responseJson);
        var value = resJson['data']['language_data']=='{}'?{}:resJson['data']['language_data'] as Map<String,dynamic>;
        Map<String,String> json = {};
        value.forEach((key, value) {
          json[key] = value.toString();
        });
        language['${localizationController.locale.languageCode}_${localizationController.locale.countryCode}'] = json;
        Get.addTranslations(Messages(languages: language).keys);
      }catch(e){
        CustomSnackbar.showCustomSnackbar(errorList: [e.toString()], msg: [], isError: true);
      }

    } else{
      CustomSnackbar.showCustomSnackbar(errorList: [response.message],msg: [],isError: true);
    }

  }



  void saveLanguageList(String languageJson)async{
    await gsRepo.apiClient.sharedPreferences.setString(SharedPreferenceHelper.langListKey, languageJson);
    return;
  }


}
