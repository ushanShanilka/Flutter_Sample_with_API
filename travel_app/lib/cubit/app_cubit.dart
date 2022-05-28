import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubite_states.dart';
import 'package:travel_app/model/Place.dart';
import 'package:travel_app/services/data_services.dart';

class AppCubites extends Cubit<CubiteStates> {
  AppCubites({required this.data}) : super(InitialiState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  detailPage(Place place) {
    emit(DetailsState(place));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
