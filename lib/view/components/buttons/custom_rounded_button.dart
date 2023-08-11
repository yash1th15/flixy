import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/my_color.dart';
import '../../../core/utils/styles.dart';



class CustomRoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  final double verticalPadding;
  final double horizontalPadding;
  final double horizontalMargin;
  final double verticalMargin;

  const CustomRoundedButton(
      {Key? key,
      required this.text,
      required this.press,
      this.color = MyColor.primaryColor,
      this.textColor = Colors.white,
      this.horizontalPadding = 10,
      this.verticalPadding = 4,
      this.horizontalMargin = 0,
      this.verticalMargin = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: verticalMargin, horizontal: horizontalMargin),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: color),
        child: Text(
          text.tr,
          style: mulishBold.copyWith(color:textColor),
        ),
      ),
    );
  }


}
