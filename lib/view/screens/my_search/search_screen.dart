import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JillaOne/core/utils/my_color.dart';
import 'package:JillaOne/data/controller/my_search_controller/search_controller.dart';
import 'package:JillaOne/data/repo/my_search/my_search_repo.dart';
import 'package:JillaOne/data/services/api_service.dart';
import 'package:JillaOne/view/components/no_data_widget.dart';
import 'package:JillaOne/view/components/app_bar/custom_appbar.dart';
import 'package:JillaOne/view/screens/sub_category/widget/search_result_widget.dart';

import '../../../constants/my_strings.dart';


class SearchScreen extends StatefulWidget {
  final String searchText;
  const SearchScreen({Key? key,required this.searchText}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {


  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(MySearchRepo(apiClient: Get.find()));
    Get.put(MySearchController(repo: Get.find(),searchText:widget.searchText));
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MySearchController>(builder: (controller)=>
        SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.colorBlack,
        appBar: const CustomAppBar(title:MyStrings.searchResult),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: !controller.isLoading && controller.movieList.isEmpty?const NoDataFoundScreen():Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchResultListWidget(searchText: widget.searchText,),
            ],
          ),
        ),
      ),
    ));
  }

}
