import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubite_states.dart';
import 'package:travel_app/pages/detail_page.dart';
import 'package:travel_app/pages/home_page.dart';
import 'package:travel_app/pages/welcome_page.dart';

class AppCubiteLogics extends StatefulWidget {
  const AppCubiteLogics({Key? key}) : super(key: key);

  @override
  State<AppCubiteLogics> createState() => _AppCubiteLogicsState();
}

class _AppCubiteLogicsState extends State<AppCubiteLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubites, CubiteStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return WelcomePage();
          }
          if (state is DetailsState) {
            return Center(
              child: DetailPage(),
            );
          }
          if (state is LoadedState) {
            return Center(
              child: HomePage(),
            );
          }
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
