import 'package:JillaOne/core/route/route.dart';
import 'package:JillaOne/data/controller/home/home_controller.dart';
import 'package:JillaOne/view/components/dialog/login_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../core/utils/my_images.dart';
import '../../../../../../core/utils/url_container.dart';
import '../../../../../components/dialog/subscribe_now_dialog.dart';
import '../custom_network_image/custom_network_image.dart';


class SingleBannerWidget extends StatefulWidget {
  const SingleBannerWidget({Key? key}) : super(key: key);

  @override
  State<SingleBannerWidget> createState() => _SingleBannerWidgetState();
}

class _SingleBannerWidgetState extends State<SingleBannerWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller)=>controller.singleBannerImageLoading || controller.singleBannerList.isEmpty?
    Container(
      width: double.infinity,
      height: 160,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          image:  const DecorationImage(
              image: AssetImage(MyImages.errorImage),
              fit: BoxFit.cover
          )
      ),
      child: controller.singleBannerImageLoading?const Icon(Icons.error_outline_outlined,color: Colors.grey,):Image.asset(MyImages.placeHolderImage),
    ) : GestureDetector(
      onTap: () {
        bool isFree  =  controller.singleBannerList[0].version=='0'?true:false;
        bool isPaidUser = controller.homeRepo.apiClient.isPaidUser();
        if(controller.isGuest() && isFree==false){
          showLoginDialog(context);
        }else if(!isPaidUser && isFree == false){
          showSubscribeDialog(context);
        } else{
          Get.toNamed(RouteHelper.movieDetailsScreen,arguments:[ controller.singleBannerList[0].id,-1]);
        }
      },
      child: Container(
        width: double.infinity,
        height: 160,
        decoration:  const BoxDecoration(
          gradient:  LinearGradient(colors: [
            Colors.black,
            Colors.black
          ]
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: CustomNetworkImage(
            boxFit: BoxFit.cover,
            imageUrl: '${UrlContainer.baseUrl}${controller.singleBannerImagePath}${controller.singleBannerList[0].image?.landscape}',
           ),
        ),
      ),
    ));
  }
}
