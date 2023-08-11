import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JillaOne/core/utils/dimensions.dart';
import 'package:JillaOne/core/utils/my_color.dart';
import 'package:JillaOne/core/utils/styles.dart';
import 'package:JillaOne/data/controller/my_watch_history_controller/my_watch_history_controller.dart';
import 'package:JillaOne/data/repo/mywatch_repo/my_watch_history_repo.dart';
import 'package:JillaOne/data/services/api_service.dart';
import 'package:JillaOne/view/components/no_data_widget.dart';
import 'package:JillaOne/view/components/app_bar/custom_appbar.dart';
import 'package:JillaOne/view/screens/movie_details/widget/rating_and_watch_widget/RatingAndWatchWidget.dart';


import '../../../constants/my_strings.dart';
import '../../components/header_light_text.dart';
import '../bottom_nav_pages/home/widget/custom_network_image/custom_network_image.dart';
import '../wish_list/widget/wish_list_shimmer.dart';

class MyWatchHistoryScreen extends StatefulWidget {
  const MyWatchHistoryScreen({Key? key}) : super(key: key);

  @override
  State<MyWatchHistoryScreen> createState() => _MyWatchHistoryScreenState();
}

class _MyWatchHistoryScreenState extends State<MyWatchHistoryScreen> {



  final ScrollController _controller = ScrollController();

  fetchData() {
    Get.find<MyWatchHistoryController>().fetchNewList();
  }

  void _scrollListener() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      if (Get.find<MyWatchHistoryController>().hasNext()) {
        fetchData();
      }
    }
  }

  @override
  void initState() {

    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(MyWatchHistoryRepo(apiClient: Get.find()));
   final controller= Get.put(MyWatchHistoryController(repo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.fetchInitialList();
      _controller.addListener(() {_scrollListener();});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyWatchHistoryController>(builder: (controller)=>Scaffold(
      backgroundColor: MyColor.secondaryColor,
      appBar:const CustomAppBar(title:MyStrings.myHistory),
      body:controller.isLoading? const WishlistShimmer(isShowCircle: false,) :  controller.movieList.isEmpty?const NoDataFoundScreen():
      Padding(
        padding: const EdgeInsets.only(top:15),
        child:  ListView.builder(
         itemCount: controller.movieList.length+1,
          controller: _controller,
          itemBuilder: (context, index) {
            if(controller.movieList.length==index){
              return controller.hasNext()? const Center(child: CircularProgressIndicator(color: MyColor.primaryColor,)):const SizedBox();
            }
            return InkWell(
              onTap: () {
                controller.gotoDetailsPage(index);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(Dimensions.cardRadius),
                          child: CustomNetworkImage(
                            imageUrl: controller.getImagePath(index),
                            height: 150,
                            width: 120,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              HeaderLightText(
                                  text: controller.movieList[index].item != null ? controller.movieList[index].item?.title?.tr ?? '' :
                                  controller.movieList[index].episode?.title?.tr ?? ''
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  RatingAndWatchWidget(
                                      watch: controller.movieList[index].item?.view ?? '0.0',
                                      rating: controller.movieList[index].item?.ratings ?? '0.0')
                                ],
                              )
                            ],
                          ),
                        ),

                      ],
                    ),
                    const SizedBox(height: 10,),
                    Divider(color: controller.movieList.length-1==index && !controller.hasNext()?Colors.transparent:MyColor.bodyTextColor,),
                    SizedBox(height: controller.movieList.length-1==index && !controller.hasNext()?0:10,)
                  ],
                ),
              ),
            );
          }
       )

    )));
  }


}
