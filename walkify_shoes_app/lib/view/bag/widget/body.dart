// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps, sized_box_for_whitespace, unused_import

import 'package:flutter/material.dart';
import 'package:sneakers_app/theme/custom_app_theme.dart';

import '../../../../utils/app_methods.dart';
import '../../../animation/fadeanimation.dart';
import '../../../utils/constants.dart';
import '../../../view/bag/widget/empty_list.dart';
import '../../../data/dummy_data.dart';
import '../../../models/models.dart';
import 'package:sneakers_app/screens/payment_page.dart';

class BodyBagView extends StatefulWidget {
  const BodyBagView({Key? key}) : super(key: key);

  @override
  _BodyBagViewState createState() => _BodyBagViewState();
}

class _BodyBagViewState extends State<BodyBagView>
    with SingleTickerProviderStateMixin {
  int lengthsOfItemsOnBag = itemsOnBag.length;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      width: width,
      height: height,
      child: SingleChildScrollView(
        // 👈 ADDED THIS
        child: Column(
          children: [
            topText(width, height),
            Divider(
              color: Colors.grey,
            ),
            itemsOnBag.isEmpty
                ? EmptyList()
                : Column(
                    children: [
                      mainListView(width, height),
                      SizedBox(height: 12),
                      bottomInfo(width, height),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  // Top Texts Components
  topText(width, height) {
    return Container(
      width: width,
      height: height / 14,
      child: FadeAnimation(
        delay: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("My Bag", style: AppThemes.bagTitle),
            Row(
              children: [
                Text(
                  "Total $lengthsOfItemsOnBag Items",
                  style: AppThemes.bagTotalPrice,
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      itemsOnBag.clear();
                      lengthsOfItemsOnBag = 0;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Clear",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Material Button Components
  materialButton(width, height) {
    return FadeAnimation(
      delay: 3,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        minWidth: width / 1.2,
        height: height / 15,
        color: AppConstantsColor.materialButtonColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PaymentPage()),
          );
        },
        child: Text(
          "NEXT",
          style: TextStyle(color: AppConstantsColor.lightTextColor),
        ),
      ),
    );
  }

  // Main ListView Components
  mainListView(width, height) {
    return Container(
      width: width,
      height: height / 1.6,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: itemsOnBag.length,
        shrinkWrap: true, // 👈 ADDED THIS
        itemBuilder: (ctx, index) {
          ShoeModel currentBagItem = itemsOnBag[index];
          return FadeAnimation(
            delay: 1.5 * index / 4,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 1),
              width: width,
              height: height / 5.2,
              child: Row(
                children: [
                  Container(
                    width: width / 2.8,
                    height: height / 5.7,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 20,
                          left: 10,
                          child: Container(
                            width: width / 3.6,
                            height: height / 7.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.grey[350],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 2,
                          bottom: 15,
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(-40 / 360),
                            child: Container(
                              width: 140,
                              height: 140,
                              child: Image(
                                image: AssetImage(
                                  currentBagItem.imgAddress,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(currentBagItem.model,
                            style: AppThemes.bagProductModel),
                        SizedBox(height: 4),
                        Text("₹${currentBagItem.price}",
                            style: AppThemes.bagProductPrice),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (currentBagItem.quantity > 1) {
                                    currentBagItem.quantity--;
                                  } else {
                                    itemsOnBag.remove(currentBagItem);
                                    lengthsOfItemsOnBag = itemsOnBag.length;
                                  }
                                });
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[300],
                                ),
                                child:
                                    Center(child: Icon(Icons.remove, size: 15)),
                              ),
                            ),
                            SizedBox(width: 10),
                            Text("${currentBagItem.quantity}",
                                style: AppThemes.bagProductNumOfShoe),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentBagItem.quantity++;
                                });
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[300],
                                ),
                                child: Center(child: Icon(Icons.add, size: 15)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

// Bottom Info (Total Price + Button)
  bottomInfo(width, height) {
    double totalPrice = 0;
    for (var item in itemsOnBag) {
      totalPrice += item.price * item.quantity;
    }

    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: width,
      height: height / 7,
      child: Column(
        children: [
          FadeAnimation(
            delay: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("TOTAL", style: AppThemes.bagTotalPrice),
                Text("₹$totalPrice", style: AppThemes.bagSumOfItemOnBag),
              ],
            ),
          ),
          SizedBox(height: 30),
          materialButton(width, height),
        ],
      ),
    );
  }
}
