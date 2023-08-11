import 'package:JillaOne/view/components/dialog/login_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JillaOne/core/utils/my_color.dart';
import 'package:JillaOne/core/utils/styles.dart';
import 'package:JillaOne/data/controller/all_episode_controller/all_episode_controller.dart';
import 'package:JillaOne/data/repo/all_episode_repo/all_episode_repo.dart';
import '../../../components/dialog/subscribe_now_dialog.dart';
import '../../bottom_nav_pages/home/widget/custom_network_image/custom_network_image.dart';
import '../../../../core/route/route.dart';
import '../../../../core/utils/url_container.dart';
import '../../bottom_nav_pages/home/shimmer/grid_shimmer.dart';

class AllEpisodeListWidget extends StatefulWidget {
  const AllEpisodeListWidget({Key? key}) : super(key: key);

  @override
  State<AllEpisodeListWidget> createState() => _AllEpisodeListWidgetState();
}

class _AllEpisodeListWidgetState extends State<AllEpisodeListWidget> {

  final ScrollController _controller = ScrollController();


  void _scrollListener() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      if (Get.find<AllEpisodeController>().hasNext()) {
        Get.find<AllEpisodeController>().fetchNewMovieList();
      }
    }
  }

  @override
  void initState() {

    Get.put(AllEpisodeRepo(apiClient: Get.find()));
    Get.put(AllEpisodeController(repo: Get.find()));
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.addListener(_scrollListener);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllEpisodeController>(
        builder: (controller) => controller.isLoading
            ? const GridShimmer()
            : GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                itemCount: controller.episodeList.length+1,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 12,
                        crossAxisCount: 3,
                        childAspectRatio: .55),
                itemBuilder: (context, index) {

                  if(index==controller.episodeList.length){
                    return controller.hasNext()?const SizedBox(
                        height: 30,
                        width: 30,
                        child: Center(child: CircularProgressIndicator(color: MyColor.primaryColor,))):const SizedBox.shrink();
                  }

                  return Card(
                      clipBehavior: Clip.antiAlias,
                      margin: EdgeInsets.zero,
                      color: MyColor.colorBlack,
                      shape: const RoundedRectangleBorder(),
                      child: GestureDetector(
                        onTap: () {
                          bool isFree  =  controller.episodeList[index].version=='0'?true:false;
                          bool isPaidUser = controller.repo.apiClient.isPaidUser();
                          if(controller.isGuest() && isFree==false){
                            showLoginDialog(context);
                          }else if(!isPaidUser && isFree == false){
                            showSubscribeDialog(context);
                          } else{
                            Get.toNamed(RouteHelper.movieDetailsScreen, arguments: [controller.episodeList[index].id, -1]);
                          }
                        },
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Expanded(
                                child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CustomNetworkImage(
                                  imageUrl: '${UrlContainer.baseUrl}${controller.portraitImagePath}${controller.episodeList[index].image?.portrait}',
                                  height: 200,
                                ),
                              )),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                color: MyColor.colorBlack,
                                child: Text(
                                    controller.episodeList[index].title?.tr ?? '',
                                    style: mulishSemiBold.copyWith(color: MyColor.colorWhite, overflow: TextOverflow.ellipsis)),
                              ),
                            ]),
                      ));
                }));
  }
}
