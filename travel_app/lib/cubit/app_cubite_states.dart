import 'package:equatable/equatable.dart';
import 'package:travel_app/model/Place.dart';

abstract class CubiteStates extends Equatable {}

class InitialiState extends CubiteStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class WelcomeState extends CubiteStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends CubiteStates {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends CubiteStates {
  @override
  LoadedState(this.places);
  final List<Place> places;
  // TODO: implement props
  List<Object> get props => [places];
}

class DetailsState extends CubiteStates {
  @override
  DetailsState(this.place);
  final Place place;
  // TODO: implement props
  List<Object> get props => [place];
}
