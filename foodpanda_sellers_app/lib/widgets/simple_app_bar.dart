import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  String? title;
  final PreferredSizeWidget? bottom;

  SimpleAppBar({Key? key, this.bottom, this.title}) : super(key: key);

  @override
  Size get preferredSize => bottom == null
      ? Size(56, AppBar().preferredSize.height)
      : Size(56, 80 + AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.cyan,
                Colors.amber,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
      ),
      centerTitle: true,
      title: Text(
        title!,
        style: const TextStyle(
            fontSize: 45.0,
            letterSpacing: 3,
            color: Colors.white,
            fontFamily: "Signatra"),
      ),
    );
  }
}
