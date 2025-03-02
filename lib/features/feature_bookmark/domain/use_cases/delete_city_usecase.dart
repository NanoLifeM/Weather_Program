
// ignore_for_file: eol_at_end_of_file

import 'package:weather_program/core/resources/data_state.dart';
import 'package:weather_program/core/usecase/use_case.dart';
import 'package:weather_program/features/feature_bookmark/domain/repository/city_repository.dart';

class DeleteCityUseCase implements UseCase<DataState<String>, String>{
  final CityRepository _cityRepository;
  DeleteCityUseCase(this._cityRepository);

  @override
  Future<DataState<String>> call(String params) {
    return _cityRepository.deleteCityByName(params);
  }
}