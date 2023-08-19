import 'package:flutter/material.dart';
import 'package:foodpanda_users_app/mainScreens/items_screen.dart';
import 'package:foodpanda_users_app/models/menus.dart';
import 'package:foodpanda_users_app/until/colors.dart';
import 'package:foodpanda_users_app/until/styles.dart';

// ignore: must_be_immutable
class MenusDesignWidget extends StatefulWidget {
  Menus? model;
  BuildContext? context;

  MenusDesignWidget({super.key, this.model, this.context});

  @override
  _MenusDesignWidgetState createState() => _MenusDesignWidgetState();
}

class _MenusDesignWidgetState extends State<MenusDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (c) => ItemsScreen(model: widget.model)));
      },
      splashColor: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 290,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: 16, right: 16, bottom: 12, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(32)),
               color: Colors.white,
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    child: ClipRRect(
                          borderRadius: const BorderRadius.all( Radius.circular(32.0),),
                        child: Image.network(
                        widget.model!.thumbnailUrl!,
                        height: 220.0,
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                      ))),
                  Positioned(
                    top: 24,
                    left: 18,
                    child: 
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white
                        ),
                        child: Row(children: [
                          Text('\$', style: Styles.style20.copyWith(color: ColorUtil.orangeFE),),
                          Text('10.00', style: Styles.style20)
                        ],)
                      )
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.model!.menuTitle!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
               const SizedBox(
                height: 6.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.model!.menuInfo!,
                  style: Styles.styleGray14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
