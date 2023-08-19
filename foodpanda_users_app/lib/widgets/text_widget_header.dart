import 'package:flutter/material.dart';
import 'package:foodpanda_users_app/until/colors.dart';



class TextWidgetHeader extends SliverPersistentHeaderDelegate
{
  String? title;
  TextWidgetHeader({this.title});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent,)
  {
    return InkWell(
      child: Container(
        // decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: [
        //         Colors.cyan,
        //         Colors.amber,
        //       ],
        //       begin:  FractionalOffset(0.0, 0.0),
        //       end:  FractionalOffset(1.0, 0.0),
        //       stops: [0.0, 1.0],
        //       tileMode: TileMode.clamp,
        //     )
        // ),
        padding: EdgeInsets.symmetric(horizontal: 16),
        color: Colors.white,
        height: 60.0,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerLeft,
        child: InkWell(
          child: Text(
            title!,
            maxLines: 2,
            textAlign: TextAlign.start,
            style: const TextStyle(
              // fontFamily: "Signatra",
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
              color: ColorUtil.black5B,
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 50;

  @override
  // TODO: implement minExtent
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
