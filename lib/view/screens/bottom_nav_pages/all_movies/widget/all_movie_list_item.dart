import 'package:JillaOne/core/utils/dimensions.dart';
import 'package:JillaOne/view/components/dialog/login_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:JillaOne/core/utils/my_color.dart';
import 'package:JillaOne/core/utils/styles.dart';
import 'package:JillaOne/data/controller/all_movies_controller/all_movies_controller.dart';
import 'package:JillaOne/data/repo/all_movies_repo/all_movies_repo.dart';
import '../../../../../core/route/route.dart';
import '../../../../../core/utils/url_container.dart';
import '../../../../components/dialog/subscribe_now_dialog.dart';
import '../../home/shimmer/grid_shimmer.dart';
import '../../home/widget/custom_network_image/custom_network_image.dart';


class AllMovieListWidget extends StatefulWidget {
  const AllMovieListWidget({Key? key}) : super(key: key);

  @override
  State<AllMovieListWidget> createState() => _AllMovieListWidgetState();
}

class _AllMovieListWidgetState extends State<AllMovieListWidget> {

  final ScrollController _controller = ScrollController();


  void _scrollListener() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      if (Get.find<AllMoviesController>().hasNext()) {
        Get.find<AllMoviesController>().fetchNewMovieList();
      }
    }
  }

  @override
  void initState() {
    Get.put(AllMoviesRepo(apiClient: Get.find()));
    AllMoviesController controller = Get.put(AllMoviesController(repo: Get.find()));
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchInitialMovieList();
      _controller.addListener(_scrollListener);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    Get.find<AllMoviesController>().updatePaginationLoading(false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllMoviesController>(
        builder: (controller) => controller.isLoading
            ? GridShimmer()
            : AnimationLimiter(
              child: GridView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical:Dimensions.space15,horizontal:Dimensions.space15),
                  physics: const BouncingScrollPhysics(),
                  controller: _controller,
                  itemCount: controller.movieList.length+1,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: Dimensions.gridViewCrossAxisSpacing,
                          mainAxisSpacing: Dimensions.gridViewMainAxisSpacing,
                          crossAxisCount: 3,
                          childAspectRatio: .55),
                  itemBuilder: (context, index) {

                    if(controller.movieList.length==index){
                      return controller.hasNext()? const SizedBox(
                          height: 30,
                          width: 30,
                          child: Center(child: CircularProgressIndicator(color: MyColor.primaryColor,))):const SizedBox.shrink();
                    }

                    return  AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 1000),
                      columnCount: 3,
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: Card(
                              clipBehavior: Clip.antiAlias,
                              margin: EdgeInsets.zero,
                              color: MyColor.colorBlack,
                              shape:  RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  ),
                              child: GestureDetector(
                                onTap: () {
                                  bool isFree  =  controller.movieList[index].version=='0'?true:false;
                                  bool isPaidUser = controller.repo.apiClient.isPaidUser();
                                  if(controller.isGuest() && isFree==false){
                                    showLoginDialog(context);
                                  }else if(!isPaidUser && isFree == false){
                                    showSubscribeDialog(context);
                                  } else{
                                    Get.toNamed(RouteHelper.movieDetailsScreen, arguments: [controller.movieList[index].id, -1]);
                                  }
                                },
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      Expanded(
                                        child: ClipRRect(
                                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
                                        child: CustomNetworkImage(
                                          imageUrl: '${UrlContainer.baseUrl}${controller.portraitImagePath}${controller.movieList[index].image?.portrait}',
                                          height: 200,
                                        ),
                                      )),
                                      Container(
                                        padding: const EdgeInsets.only(right: 8.0,bottom: 8.0,top: 8.0),
                                        color: MyColor.colorBlack,
                                        child: Text(
                                            controller.movieList[index].title?.tr??'',
                                            style: mulishSemiBold.copyWith(
                                                color: MyColor.colorWhite,
                                                overflow: TextOverflow.ellipsis)),
                                      ),
                                    ]),
                              )),
                        ),
                      ),
                    );
                  }),
            ));
  }
}
