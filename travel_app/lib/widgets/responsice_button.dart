import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/misc/color.dart';
import 'package:travel_app/widgets/app_test.dart';

class RensponsiveButtons extends StatelessWidget {
  bool? isResponsive;
  double? width;
  String? text;

  RensponsiveButtons(
      {Key? key, this.width, this.isResponsive = false, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
      width: isResponsive == true ? double.maxFinite : width,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.mainColor),
      child: Row(
        mainAxisAlignment: isResponsive == true
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          isResponsive == true
              ? Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: AppText(
                    text: text.toString(),
                    color: Colors.white,
                  ),
                )
              : Container(),
          Image.asset("assets/images/button-one.png"),
        ],
      ),
    ));
  }
}
