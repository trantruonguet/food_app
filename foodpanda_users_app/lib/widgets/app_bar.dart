import 'package:flutter/material.dart';
import 'package:foodpanda_users_app/assistantMethods/cart_Item_counter.dart';
import 'package:foodpanda_users_app/mainScreens/cart_screen.dart';
import 'package:foodpanda_users_app/until/images.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  final String? sellerUID;

  MyAppBar({this.bottom, this.sellerUID});

  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => bottom == null
      ? Size(56, AppBar().preferredSize.height)
      : Size(56, 80 + AppBar().preferredSize.height);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        // decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //   colors: [
        //     Colors.cyan,
        //     Colors.amber,
        //   ],
        //   begin: FractionalOffset(0.0, 0.0),
        //   end: FractionalOffset(1.0, 0.0),
        //   stops: [0.0, 1.0],
        //   tileMode: TileMode.clamp,
        // )),
        padding: EdgeInsets.only(left: 150, top: 32),
        color: Colors.white,
        child: Row(children: [
            Column(
              children: [
                Text('Deliver to'),
                Text(
                  'Hanoi Vietnam',
                )
              ],
            ),
            Spacer(),
            Image.asset(
              Images.icAvatar,
              height: 60,
              width: 60,
            ),
            SizedBox(width: 50,)
          ]),
      ),
      leading: 
      // IconButton(
      //   icon: const Icon(Icons.arrow_back),
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      // ),
       InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(Images.icBack, height: 38, width: 38,)),
      centerTitle: true,
      automaticallyImplyLeading: true,
      actions: [
        Stack(
          children: [
            IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.cyan,
              ),
              onPressed: () {
                //send user to cart screen
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) =>
                            CartScreen(sellerUID: widget.sellerUID)));
              },
            ),
            Positioned(
              child: Stack(
                children: [
                  const Icon(
                    Icons.brightness_1,
                    size: 20.0,
                    color: Colors.green,
                  ),
                  Positioned(
                    top: 3,
                    right: 4,
                    child: Center(
                      child: Consumer<CartItemCounter>(
                        builder: (context, counter, c) {
                          return Text(
                            counter.count.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
