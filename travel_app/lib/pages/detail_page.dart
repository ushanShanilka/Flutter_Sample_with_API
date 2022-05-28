import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubite_states.dart';
import 'package:travel_app/misc/color.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_test.dart';
import 'package:travel_app/widgets/responsice_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int ratingStart = 3;
  int selectedCount = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubites, CubiteStates>(builder: (context, state) {
      DetailsState detail = state as DetailsState;
      return Scaffold(
          body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 380,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(detail.place.img),
                          fit: BoxFit.cover)),
                )),
            Positioned(
                width: 200,
                left: 20,
                top: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubites>(context).goHome();
                      },
                      icon: Icon(Icons.menu),
                      color: Colors.white,
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.home))
                  ],
                )),
            Positioned(
                top: 360,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: detail.place.name,
                            color: Colors.black45.withOpacity(0.8),
                          ),
                          AppLargeText(
                            text: "\$ " + detail.place.price.toString(),
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.mainColor,
                          ),
                          SizedBox(width: 5),
                          AppText(
                            text: detail.place.location,
                            color: AppColors.textColor1,
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: index < detail.place.stars
                                    ? AppColors.startColor
                                    : AppColors.textColor2,
                              );
                            }),
                          ),
                          SizedBox(width: 10),
                          AppText(
                            text: "(" + detail.place.stars.toString() + ")",
                            color: AppColors.textColor2,
                          )
                        ],
                      ),
                      SizedBox(height: 25),
                      AppLargeText(
                          text: "People",
                          color: Colors.black.withOpacity(0.8),
                          size: 20),
                      SizedBox(height: 5),
                      AppText(
                        text: "Number of peope in your group",
                        color: AppColors.mainTetxColor,
                      ),
                      SizedBox(height: 5),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedCount = index;
                              });
                              log((index + 1).toString());
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: AppButton(
                                color: selectedCount == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor: selectedCount == index
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                size: 55,
                                borderColor: selectedCount == index
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                text: (index + 1).toString(),
                                // icon: Icons.favorite_border,
                                // isIcon: true,
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 20),
                      AppLargeText(
                        text: "Description",
                        color: Colors.black.withOpacity(0.8),
                        size: 20,
                      ),
                      SizedBox(height: 5),
                      AppText(
                        text: detail.place.description,
                        color: AppColors.mainTetxColor,
                      )
                    ],
                  ),
                )),
            Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(children: [
                  AppButton(
                    color: AppColors.textColor1,
                    backgroundColor: Colors.white,
                    size: 60,
                    borderColor: AppColors.textColor2,
                    isIcon: true,
                    icon: Icons.favorite_border,
                  ),
                  SizedBox(width: 20),
                  RensponsiveButtons(isResponsive: true, text: "Book Trip Now")
                ]))
          ],
        ),
      ));
    });
  }
}
