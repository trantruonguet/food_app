import 'package:flutter/material.dart';
import 'package:foodpanda_users_app/authentication/auth_screen.dart';
import 'package:foodpanda_users_app/global/global.dart';
import 'package:foodpanda_users_app/mainScreens/address_screen.dart';
import 'package:foodpanda_users_app/mainScreens/home_screen.dart';
import 'package:foodpanda_users_app/mainScreens/my_orders_screen.dart';
import 'package:foodpanda_users_app/until/colors.dart';
import 'package:foodpanda_users_app/until/images.dart';
import 'package:foodpanda_users_app/until/styles.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.white,
              Colors.red.shade50,
            ],
          ),
          // color: Colors.transparent,
        ),
        child: Stack(
          children: [
            ListView(
              children: [
                //header drawer
                Container(
                  padding: const EdgeInsets.only(top: 25, bottom: 10, left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(80)),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: SizedBox(
                            height: 90,
                            width: 90,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                sharedPreferences!.getString("photoUrl")!,
                              ),
                              backgroundColor: Colors.grey[100],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        sharedPreferences!.getString("name")!,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            // fontFamily: "Train",
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        sharedPreferences!.getString("name")! + '@gmail.com',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          // fontFamily: "Train",
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 12,
                ),

                //body drawer
                Container(
                  padding: const EdgeInsets.only(top: 1.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.asset(
                          Images.icHome,
                          height: 23,
                          width: 23,
                        ),
                        horizontalTitleGap: 5,
                        title: Text(
                          "Home",
                          style: Styles.style16,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => const HomeScreen()));
                        },
                      ),
                      ListTile(
                        leading: Image.asset(
                          Images.icDocument,
                          height: 23,
                          width: 23,
                        ),
                        horizontalTitleGap: 5,
                        title: Text(
                          "My Orders",
                          style: Styles.style16,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => MyOrdersScreen()));
                        },
                      ),
                      ListTile(
                        leading: Image.asset(
                          Images.icHistory,
                          height: 23,
                          width: 23,
                        ),
                        horizontalTitleGap: 5,
                        title: Text(
                          "History",
                          style: Styles.style16,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: Image.asset(
                          Images.icSearch,
                          height: 23,
                          width: 23,
                        ),
                        horizontalTitleGap: 5,
                        title: Text(
                          "Search",
                          style: Styles.style16,
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading:
                            // const Icon(
                            //   Icons.add_location,
                            //   color: Colors.black,
                            // ),
                            Image.asset(
                          Images.icLocation,
                          height: 23,
                          width: 23,
                        ),
                        horizontalTitleGap: 0,
                        title: Text(
                          "Add New Address",
                          style: Styles.style16,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (c) => AddressScreen(),
                            ),
                          );
                        },
                      ),
                      // ListTile(
                      //   leading: const Icon(
                      //     Icons.exit_to_app,
                      //     color: Colors.black,
                      //   ),
                      //   horizontalTitleGap: 5,
                      //   title: const Text(
                      //     "Sign Out",
                      //     style: TextStyle(
                      //       color: Colors.black,
                      //       fontSize: 16,
                      //     ),
                      //   ),
                      //   onTap: () {
                      //     firebaseAuth.signOut().then((value) {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (c) => const AuthScreen()));
                      //     });
                      //   },
                      // ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 25,
              left: 0,
              child: InkWell(
                onTap: () {
                  firebaseAuth.signOut().then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => const AuthScreen()));
                  });
                },
                child: Container(
                    margin: const EdgeInsets.only(left: 25),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    height: 45,
                    width: 120,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: ColorUtil.orangeFE,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          Images.icLogout,
                          height: 26,
                          width: 26,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Log out',
                          style: Styles.styleWhite16,
                        )
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
