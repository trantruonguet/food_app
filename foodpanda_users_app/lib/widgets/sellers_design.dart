import 'package:flutter/material.dart';
import 'package:foodpanda_users_app/mainScreens/menus_screen.dart';
import 'package:foodpanda_users_app/models/sellers.dart';
import 'package:foodpanda_users_app/until/images.dart';
import 'package:foodpanda_users_app/until/styles.dart';

// ignore: must_be_immutable
class SellersDesignWidget extends StatefulWidget {
  Sellers? model;
  BuildContext? context;

  SellersDesignWidget({super.key, this.model, this.context});

  @override
  _SellersDesignWidgetState createState() => _SellersDesignWidgetState();
}

class _SellersDesignWidgetState extends State<SellersDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (c) => MenusScreen(model: widget.model)));
        },
        splashColor: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            height: 385,
            width: MediaQuery.of(context).size.width,
            child: Container(
              margin: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(32)),
               color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32.0),
                        topRight: Radius.circular(32.0),
                      ),
                      child: Image.network(
                        widget.model!.sellerAvatarUrl!,
                        height: 220.0,
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      children: [
                        Text(
                          widget.model!.sellerName!,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 8,),
                        Image.asset(Images.icChecked, height: 16, width: 16,),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      widget.model!.sellerEmail!,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Row(
                      children: [
                        Image.asset(Images.icDelivery, height: 12, width: 14,),
                        SizedBox(width: 6,),
                        Text('Free delivery', style: Styles.style14.copyWith(color: Colors.black12),),
                        SizedBox(width: 16,),
                        Image.asset(Images.icTime, height: 11, width: 13,),
                        SizedBox(width: 6,),
                        Text('10-15 mins', style: Styles.style14.copyWith(color: Colors.black12),),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Row(
                      children: [
                        Container(
                          height: 22,
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8),),
                            color: Colors.black12.withAlpha(10),
                          ),
                          child: Text('BURGER', style: Styles.styleGray14,),
                        ),
                        SizedBox(width: 12,),
                        Container(
                          height: 22,
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8),),
                            color: Colors.black12.withAlpha(10),
                          ),
                          child: Text('CHICKEN', style: Styles.styleGray14,),
                        ),
                        SizedBox(width: 12,),
                        Container(
                          height: 22,
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8),),
                            color: Colors.black12.withAlpha(10),
                          ),
                          child: Text('FAST FOOD', style: Styles.styleGray14,),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
