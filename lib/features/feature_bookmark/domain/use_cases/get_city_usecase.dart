
// ignore_for_file: eol_at_end_of_file

import 'package:weather_program/core/resources/data_state.dart';
import 'package:weather_program/core/usecase/use_case.dart';
import 'package:weather_program/features/feature_bookmark/domain/entities/city_entity.dart';
import 'package:weather_program/features/feature_bookmark/domain/repository/city_repository.dart';

class GetCityUseCase implements UseCase<DataState<City?>, String>{
  final CityRepository _cityRepository;
  GetCityUseCase(this._cityRepository);

  @override
  Future<DataState<City?>> call(String params) {
      return _cityRepository.findCityByName(params);
  }
}