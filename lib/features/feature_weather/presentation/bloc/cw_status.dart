import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_program/features/feature_weather/domain/entities/current_city_entity.dart';

@immutable
abstract class CwStatus extends Equatable{}

class CwLoading extends CwStatus{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CwCompleted extends CwStatus{
  final CurrentCityEntity currentCityEntity;
  CwCompleted(this.currentCityEntity);

  @override
  // TODO: implement props
  List<Object?> get props => [currentCityEntity];
}

class CwError extends CwStatus{
  final String message;
  CwError(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
