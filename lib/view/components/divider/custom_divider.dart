import 'package:flutter/material.dart';
import 'package:JillaOne/core/utils/my_color.dart';

import '../../../core/utils/dimensions.dart';

class CustomDivider extends StatelessWidget {

  final double space;
  final Color color;

  const CustomDivider({
    Key? key,
    this.space = Dimensions.space20,
    this.color = MyColor.borderColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: space),
        Divider(color: color, height: 0.5, thickness: 0.5),
        SizedBox(height: space),
      ],
    );
  }
}
