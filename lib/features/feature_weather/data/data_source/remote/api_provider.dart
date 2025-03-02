import 'package:dio/dio.dart';
import 'package:weather_program/core/params/forecast_params.dart';
import 'package:weather_program/core/utils/constants.dart';
import 'package:weather_program/features/feature_weather/data/models/suggest_city_model.dart';
import 'package:weather_program/features/feature_weather/domain/entities/suggest_city_entity.dart';

class ApiProvider {
  final Dio _dio = Dio();

  String apiKey = Constants.apiKey;

  /// current weather api call
  // ignore: strict_top_level_inference, type_annotate_public_apis
  Future<dynamic> callCurrentWeather(cityName) async {
    final json = await sendRequestCitySuggestion(cityName);
    // ignore: avoid_dynamic_calls
    final SuggestCityEntity suggestCityEntity =SuggestCityModel.fromJson(json.data);

    final Response response = await _dio.get(
      '${Constants.baseUrl}/data/2.5/weather',
      queryParameters: {'lat':suggestCityEntity.data![0].latitude,'lon':suggestCityEntity.data![0].longitude, 'appid': apiKey, 'units': 'metric'},
    );
    return response;
  }

  /// 7 days forecast api
  Future<dynamic> sendRequest5DaysForcast(ForecastParams params) async {
    final response = await _dio.get(
      '${Constants.baseUrl}/data/2.5/forecast',
      queryParameters: {
        'lat': params.lat,
        'lon': params.lon,
        'appid': apiKey,
        'units': 'metric',
      },
    );

    return response;
  }

  /// city name suggest api
  Future<dynamic> sendRequestCitySuggestion(String prefix) async {
    final response = await _dio.get(
      'http://geodb-free-service.wirefreethought.com/v1/geo/cities',
      queryParameters: {'limit': 5, 'offset': 0, 'namePrefix': prefix},
    );

    return response;
  }
}
