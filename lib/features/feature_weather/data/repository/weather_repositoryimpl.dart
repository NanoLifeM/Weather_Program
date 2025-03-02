
// ignore_for_file: type_annotate_public_apis, eol_at_end_of_file

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_program/core/params/ForecastParams.dart';
import 'package:weather_program/core/resources/data_state.dart';
import 'package:weather_program/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:weather_program/features/feature_weather/data/models/current_city_model.dart';
import 'package:weather_program/features/feature_weather/data/models/forecast_days_model.dart';
import 'package:weather_program/features/feature_weather/data/models/suggest_city_model.dart';
import 'package:weather_program/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:weather_program/features/feature_weather/domain/entities/forecast_days_entity.dart';
import 'package:weather_program/features/feature_weather/domain/entities/suggest_city_entity.dart';
import 'package:weather_program/features/feature_weather/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository{
  final ApiProvider _apiProvider;

  WeatherRepositoryImpl(this._apiProvider);

  @override
  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(String cityName)  async {
   try{

     final Response response= await _apiProvider.callCurrentWeather( cityName);

     if(response.statusCode==200){
       final CurrentCityEntity currentCityEntity=CurrentCityModel.fromJson(response.data);
       return DataSuccess(currentCityEntity);
     }else{
       return DataFailed('Something Went Wrong. try again...');
     }
   }
   catch(e){
     return DataFailed('Please check your connection...');
   }
  }

  @override
  Future<DataState<ForecastDaysEntity>> fetchForecastWeatherData(ForecastParams params) async {
    try{
      final Response response = await _apiProvider.sendRequest5DaysForcast(params);

      if(response.statusCode == 200){
        final ForecastDaysEntity forecastDaysEntity = ForecastDaysModel.fromJson(response.data);
        return DataSuccess(forecastDaysEntity);
      }else{
        return DataFailed('Something Went Wrong. try again...');
      }
    }catch(e){
      debugPrint(e.toString());
      return DataFailed('please check your connection...');
    }
  }

  @override
  Future<List<Data>> fetchSuggestData(cityName) async{
  final Response response = await _apiProvider.sendRequestCitySuggestion(cityName);
  final SuggestCityEntity suggestCityEntity = SuggestCityModel.fromJson(response.data);
  return suggestCityEntity.data!;
  }

}