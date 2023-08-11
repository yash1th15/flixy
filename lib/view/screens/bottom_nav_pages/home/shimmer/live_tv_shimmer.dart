import 'package:flutter/material.dart';
import 'package:JillaOne/core/utils/my_color.dart';
import 'package:shimmer/shimmer.dart';
import '../../../all_live_tv/widget/live_tv_grid_item/live_tv_grid_item.dart';

class LiveTvShimmer extends StatelessWidget {
  const LiveTvShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Shimmer.fromColors(
              baseColor: MyColor.textFieldColor,
              highlightColor: MyColor.textColor,
          child: LiveTvGridItem(
              liveTvName: '',
              imageUrl: '',
              press: () {

                }),
          ));
  }
}
