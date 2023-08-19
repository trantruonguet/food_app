import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodpanda_users_app/assistantMethods/assistant_methods.dart';
import 'package:foodpanda_users_app/models/items.dart';
import 'package:foodpanda_users_app/until/colors.dart';
import 'package:foodpanda_users_app/until/images.dart';
import 'package:foodpanda_users_app/until/styles.dart';
import 'package:foodpanda_users_app/widgets/app_bar.dart';

class ItemDetailsScreen extends StatefulWidget {
  final Items? model;
  const ItemDetailsScreen({super.key, this.model});

  @override
  _ItemDetailsScreenState createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  TextEditingController counterTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(sellerUID: widget.model!.sellerUID),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 16,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(18)),
              child: Image.network(
                widget.model!.thumbnailUrl.toString(),
                height: 226,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              widget.model!.title.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: const Text("\$", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: ColorUtil.orangeFE)),
                    ),
                    Text(
                       widget.model!.price.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: ColorUtil.orangeFE),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    InkWell(child: Image.asset(Images.icSub, height: 36, width: 36,)),
                    const SizedBox(width: 8,),
                    Text('01', style: Styles.style14.copyWith(fontWeight: FontWeight.w700),),
                    const SizedBox(width: 8,),
                    InkWell(child: Image.asset(Images.icAdd, height: 36, width: 36,))
                  ],
                )
              //   Container(
              // padding: const EdgeInsets.all(18.0),
              // child: NumberInputPrefabbed.roundedButtons(
              //   controller: counterTextEditingController,
              //   incDecBgColor: Colors.amber,
              //   min: 1,
              //   max: 9,
              //   initialValue: 1,
              //   buttonArrangement: ButtonArrangement.incRightDecLeft,
              // ),
            // ),
                
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              widget.model!.longDescription.toString(),
              textAlign: TextAlign.justify,
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
            ),
          ),
          
          const SizedBox(
            height: 10,
          ),
        ],
      ),
      bottomSheet: SizedBox(
        width: double.infinity,
            child: InkWell(
              onTap: () {
                int itemCounter = int.parse(counterTextEditingController.text);
      
                List<String> separateItemIDsList = separateItemIDs();
      
                //1.check if item exist already in cart
                separateItemIDsList.contains(widget.model!.itemID)
                    ? Fluttertoast.showToast(msg: "Item is already in Cart.")
                    :
                    //2.add to cart
                    addItemToCart(widget.model!.itemID, context, itemCounter);
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white
                ),
                width: double.infinity,
                height: 80,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  width: 100,
                  child: Center(
                    child: Container(
                      width: 210,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: ColorUtil.orangeFE,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [ 
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                            child: Image.asset(Images.icBag, height: 17, width: 17,)
                          ),
                          const SizedBox(width: 12,),
                          const Text(
                            "ADD TO CART",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
