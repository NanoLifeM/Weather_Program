
// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';
import 'package:weather_program/features/feature_weather/data/models/suggest_city_model.dart';

class SuggestCityEntity extends Equatable{
  final List<Data>? data;
  final Metadata? metadata;


  SuggestCityEntity({this.data, this.metadata});

  @override
  // TODO: implement props
  List<Object?> get props => [
    data,
    metadata,
  ];

  @override
  // TODO: implement stringify
  bool? get stringify => true;
}
