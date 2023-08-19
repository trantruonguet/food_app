import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:foodpanda_users_app/assistantMethods/assistant_methods.dart';
import 'package:foodpanda_users_app/models/menus.dart';
import 'package:foodpanda_users_app/models/sellers.dart';
import 'package:foodpanda_users_app/splashScreen/splash_screen.dart';
import 'package:foodpanda_users_app/until/colors.dart';
import 'package:foodpanda_users_app/until/images.dart';
import 'package:foodpanda_users_app/widgets/menus_design.dart';
import 'package:foodpanda_users_app/widgets/progress_bar.dart';
import 'package:foodpanda_users_app/widgets/text_widget_header.dart';

class MenusScreen extends StatefulWidget {
  final Sellers? model;
  const MenusScreen({super.key, this.model});

  @override
  _MenusScreenState createState() => _MenusScreenState();
}

class _MenusScreenState extends State<MenusScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: '_MenusScreenState');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: 
        // Container(
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
        //   color: Colors.grey,
        // ),
        Container(
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
            )
          ]),
        ),
        leading: 
        InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(Images.icBack, height: 38, width: 38,)),
        // IconButton(
        //   icon: const Icon(Icons.arrow_back, color: Colors.grey,),
        //   onPressed: () {
        //     clearCartNow(context);
        //     // Navigator.push(context,
        //     //     MaterialPageRoute(builder: (c) => const MySplashScreen()));
        //     Navigator.pop(context);
        //   },
        // ),
        // title: const Text(
        //   "iFood",
        //   style: TextStyle(fontSize: 45),
        // ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.white, ColorUtil.grayDA], begin:  Alignment.centerLeft, end: Alignment.centerRight)
        ),
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
                pinned: true,
                delegate: TextWidgetHeader(
                    title: widget.model!.sellerName.toString() + " Menus")),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("sellers")
                  .doc(widget.model!.sellerUID)
                  .collection("menus")
                  .orderBy("publishedDate", descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                return !snapshot.hasData
                    ? SliverToBoxAdapter(
                        child: Center(
                          child: circularProgress(),
                        ),
                      )
                    : SliverStaggeredGrid.countBuilder(
                        crossAxisCount: 1,
                        staggeredTileBuilder: (c) => StaggeredTile.fit(1),
                        itemBuilder: (context, index) {
                          Menus model = Menus.fromJson(
                            snapshot.data!.docs[index].data()!
                                as Map<String, dynamic>,
                          );
                          return MenusDesignWidget(
                            model: model,
                            context: context,
                          );
                        },
                        itemCount: snapshot.data!.docs.length,
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
