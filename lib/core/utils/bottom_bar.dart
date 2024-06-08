import 'package:flutter/material.dart';
import 'package:shoesly/core/utils/constants.dart';

Widget bottomBar(
  BuildContext context, {
  required String title,
  required String price,
  required String buttonName,
  required void Function()? onButtonClick,
}) {
  return Container(
    height: 90,
    alignment: Alignment.center,
    color: Colors.white,
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: CustomTextStyle.bodyText100,
              ),
              Text(
                price,
                style: CustomTextStyle.headLine600,
              ),
            ],
          ),
          GestureDetector(
            onTap: onButtonClick,
            child: Container(
              height: 50,
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100)),
              child: Text(
                buttonName,
                style: CustomTextStyle.headLine300white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
