import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JillaOne/constants/my_strings.dart';
import 'package:JillaOne/core/utils/styles.dart';
import 'package:readmore/readmore.dart';
import '../../../../../core/utils/my_color.dart';


class ExpandedTextWidget extends StatefulWidget {
  final String text;
  final int teamLine;

  const ExpandedTextWidget({Key? key, required this.text,this.teamLine = 4}) : super(key: key);

  @override
  State<ExpandedTextWidget> createState() => _ExpandedTextWidgetState();
}

class _ExpandedTextWidgetState extends State<ExpandedTextWidget> {
  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      widget.text,
      trimLines: widget.teamLine,
      colorClickableText: Colors.pink,
      trimMode: TrimMode.Line,
      trimCollapsedText: MyStrings.showMore.tr,
      trimExpandedText: MyStrings.showLess.tr,
      moreStyle: mulishSemiBold.copyWith(color: MyColor.primaryColor),
      lessStyle: mulishSemiBold.copyWith(color: MyColor.primaryColor),
    );
  }
}
