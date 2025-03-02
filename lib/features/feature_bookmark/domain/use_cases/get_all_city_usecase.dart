



// ignore_for_file: eol_at_end_of_file

import 'package:weather_program/core/resources/data_state.dart';
import 'package:weather_program/core/usecase/use_case.dart';
import 'package:weather_program/features/feature_bookmark/domain/entities/city_entity.dart';
import 'package:weather_program/features/feature_bookmark/domain/repository/city_repository.dart';

class GetAllCityUseCase implements UseCase<DataState<List<City>>, NoParams>{
  final CityRepository _cityRepository;
  GetAllCityUseCase(this._cityRepository);

  @override
  Future<DataState<List<City>>> call(NoParams params) {
    return _cityRepository.getAllCityFromDB();
  }
}