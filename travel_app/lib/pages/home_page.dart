import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubite_states.dart';
import 'package:travel_app/misc/color.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_test.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List places = ["mountain-one.jpg", "mountain-two.jpg", "mountain-three.jpg"];

  var expolore = {
    "ballooning.jpg": "Ballooning",
    "Kayaking.jpg": "Kayaking",
    "snorkling.jpg": "Mountain",
    "hiking.jpg": "Hiking",
    "mountain.jpg": "Mountain",
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubites, CubiteStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 70, left: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu,
                        size: 30,
                        color: Colors.black54,
                      ),
                      Expanded(child: Container()),
                      Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.5)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: AppLargeText(text: "Discover"),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 20, right: 20),
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: AppColors.mainColor,
                      // indicator:
                      //     CricleTabIndicator(color: AppColors.mainColor, radius: 4),
                      tabs: [
                        Tab(
                          text: "Places",
                        ),
                        Tab(
                          text: "Inspration",
                        ),
                        Tab(
                          text: "Emotionls",
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  width: double.maxFinite,
                  height: 400,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                          itemCount: info.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                BlocProvider.of<AppCubites>(context)
                                    .detailPage(info[index]);
                              },
                              child: Container(
                                  margin:
                                      const EdgeInsets.only(right: 15, top: 10),
                                  width: 200,
                                  height: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: NetworkImage(info[index].img),
                                          fit: BoxFit.cover))),
                            );
                          }),
                      Text("There"),
                      Text("by")
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(
                        text: "Expolore more",
                        size: 22,
                      ),
                      AppText(
                        text: "See all",
                        color: AppColors.textColor2,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  width: double.maxFinite,
                  height: 120,
                  margin: const EdgeInsets.only(left: 20),
                  child: ListView.builder(
                      itemCount: expolore.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  // margin: const EdgeInsets.only(right: 50),
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage("assets/images/" +
                                              expolore.keys.elementAt(index)),
                                          fit: BoxFit.cover))),
                              SizedBox(height: 5),
                              Container(
                                child: AppText(
                                  text: expolore.values.elementAt(index),
                                  color: AppColors.textColor2,
                                  size: 12,
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class CricleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CricleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    throw _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2, configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
