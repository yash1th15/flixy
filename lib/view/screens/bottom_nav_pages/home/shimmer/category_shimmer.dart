import 'package:flutter/material.dart';
import 'package:JillaOne/core/utils/my_color.dart';
import 'custom_shimmer_effect.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    int offset = 0;
    int time = 800;

    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index){
          offset += 5;
          time = 800 + offset;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white30,width: 1),
                borderRadius: BorderRadius.circular(8),
                color: MyColor.textFieldColor,
              ),
              child: ClipRRect(borderRadius: BorderRadius.circular(8),child:const MyShimmerEffectUI.rectangular(height: 20,width: 70,)),
            );});
  }
}
