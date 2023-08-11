
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:JillaOne/constants/my_strings.dart';
import 'package:JillaOne/core/route/route.dart';
import 'package:JillaOne/core/utils/dimensions.dart';
import 'package:JillaOne/core/utils/styles.dart';
import 'package:JillaOne/view/components/buttons/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../core/utils/my_color.dart';
import '../buttons/category_button.dart';


  showSubscribeDialog(BuildContext context,{bool fromDetails = false}){
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      dialogBackgroundColor: MyColor.otpBgColor,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      buttonsBorderRadius: const BorderRadius.all(
        Radius.circular(2),
      ),
      dismissOnTouchOutside: true,
      dismissOnBackKeyPress: true,
      onDismissCallback: (type) {},
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Text(MyStrings.plsSubscribeToWatch.tr,textAlign:TextAlign.center,style:mulishRegular.copyWith(color: MyColor.colorWhite,fontSize: Dimensions.fontLarge),),
          const SizedBox(height: 20,),
        ],
      ),
      headerAnimationLoop: false,
      animType: AnimType.bottomSlide,
      showCloseIcon: true,
      closeIcon: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: MyColor.colorGrey3.withOpacity(.1)
        ),
        child: const Icon(Icons.clear,size: 20,color: Colors.white,),
      ),
      btnOk: RoundedButton(
        vPadding: 11,
        text: MyStrings.subscribeNow,
        press: (){
          Get.toNamed(RouteHelper.subscribeScreen);
      },color: MyColor.primaryColor),
      btnOkOnPress: () {
        Get.toNamed(RouteHelper.subscribeScreen);
      },
    ).show();
  }
