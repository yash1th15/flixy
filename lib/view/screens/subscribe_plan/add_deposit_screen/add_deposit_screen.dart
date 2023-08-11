import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JillaOne/core/helper/string_format_helper.dart';
import 'package:JillaOne/core/utils/my_color.dart';
import 'package:JillaOne/view/components/app_bar/custom_appbar.dart';

import '../../../../constants/my_strings.dart';
import '../../../../data/controller/deposit_controller/add_new_deposit_controller.dart';
import '../../../../data/repo/deposit_repo/deposit_repo.dart';
import 'body.dart';

class AddDepositScreen extends StatefulWidget {
  const AddDepositScreen({Key? key}) : super(key: key);

  @override
  State<AddDepositScreen> createState() => _AddDepositScreenState();
}

class _AddDepositScreenState extends State<AddDepositScreen> {

  String price='-1';
  String planName='';
  String subId = '';
  String planId = '';

  @override
  void initState() {

    price=Get.arguments[0];
    planName=Get.arguments[1];
    subId = Get.arguments[2];
    planId = Get.arguments[3];

    Get.put(DepositRepo(apiClient: Get.find()));
    final controller = Get.put(AddNewDepositController(depositRepo: Get.find(),subId: subId));
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.setPlanId(planId);
      controller.beforeInitLoadData(price);
    });

  }
  @override
  void dispose() {
    Get.find<AddNewDepositController>().clearData();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: MyColor.colorBlack,
          appBar:  const CustomAppBar(title:MyStrings.addPayment,bgColor: Colors.transparent                                                                                                                                                                                                                                                  ,),
          body:  Body(price: price,planName: planName,),
        );
  }
}
