import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JillaOne/core/route/route.dart';
import 'package:JillaOne/core/utils/styles.dart';

import '../../../core/utils/my_color.dart';
import '../../../data/services/api_service.dart';
import '../dialog/exit_dialog.dart';
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget{

  final String title;
  final bool isShowBackBtn;
  final Color? bgColor;
  final bool isShowActionBtn;
  final bool isTitleCenter;
  final bool fromAuth;
  final bool isProfileCompleted;
  final dynamic actionIcon;
  final VoidCallback? actionPress;
  final bool isActionIconAlignEnd;
  final String actionText;
  final bool isActionImage;
  final Color? textColor;

  const CustomAppBar({Key? key,
    this.isProfileCompleted=false,
    this.fromAuth = false,
    this.isTitleCenter = false,
    this.bgColor,
    this.isShowBackBtn=true,
    required this.title,
    this.isShowActionBtn=false,
    this.actionText = '',
    this.actionIcon,
    this.actionPress,
    this.isActionIconAlignEnd = false,
    this.isActionImage = true,
    this.textColor
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size(double.maxFinite, 50);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool hasNotification =false;
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isShowBackBtn?AppBar(
      elevation: 0,
      titleSpacing: 0,
      leading:widget.isShowBackBtn?IconButton(onPressed: (){
        if(widget.fromAuth){
          Get.offAllNamed(RouteHelper.loginScreen);
        }else if(widget.isProfileCompleted){
          showExitDialog(Get.context!);
        }
        else{
          String previousRoute=Get.previousRoute;
          if(previousRoute=='/splash-screen'){
            Get.offAndToNamed(RouteHelper.homeScreen);
          }else{
            Get.back();
          }
        }
      },icon: Icon(Icons.arrow_back,color: widget.textColor??MyColor.colorWhite, size: 20)):const SizedBox.shrink(),
      backgroundColor: widget.bgColor??Colors.transparent,
      title: Text(widget.title.tr,style: mulishRegular.copyWith(color: widget.textColor??MyColor.colorWhite)),
      centerTitle: widget.isTitleCenter,
    ):AppBar(
      titleSpacing: 15,
      elevation: 0,
      backgroundColor: widget.bgColor??MyColor.cardBg,
      title:Text(widget.title.tr,style: mulishRegular.copyWith(color: MyColor.colorWhite)),
      automaticallyImplyLeading: false,
    );
  }


}