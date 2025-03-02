// ignore_for_file: strict_top_level_inference, type_annotate_public_apis

import 'package:weather_program/core/params/ForecastParams.dart';
import 'package:weather_program/core/resources/data_state.dart';
import 'package:weather_program/features/feature_weather/data/models/suggest_city_model.dart';
import 'package:weather_program/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:weather_program/features/feature_weather/domain/entities/forecast_days_entity.dart';

abstract class WeatherRepository {
  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(String cityName);

  Future<DataState<ForecastDaysEntity>> fetchForecastWeatherData(
    ForecastParams params,
  );

  Future<List<Data>> fetchSuggestData(cityName);
}
