
// ignore_for_file: eol_at_end_of_file

import 'package:weather_program/core/params/ForecastParams.dart';
import 'package:weather_program/core/resources/data_state.dart';
import 'package:weather_program/core/usecase/use_case.dart';
import 'package:weather_program/features/feature_weather/domain/entities/forecast_days_entity.dart';
import 'package:weather_program/features/feature_weather/domain/repository/weather_repository.dart';

class GetForecastWeatherUseCase implements UseCase<DataState<ForecastDaysEntity>, ForecastParams>{
  final WeatherRepository _weatherRepository;
  GetForecastWeatherUseCase(this._weatherRepository);

  @override
  Future<DataState<ForecastDaysEntity>> call(ForecastParams params) {
    return _weatherRepository.fetchForecastWeatherData(params);
  }

}