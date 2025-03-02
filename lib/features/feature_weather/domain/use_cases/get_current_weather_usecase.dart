
import 'package:weather_program/core/resources/data_state.dart';
import 'package:weather_program/core/usecase/use_case.dart';
import 'package:weather_program/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:weather_program/features/feature_weather/domain/repository/weather_repository.dart';

class GetCurrentWeatherUseCase extends UseCase<DataState<CurrentCityEntity>,String>{
  final WeatherRepository weatherRepository;
  GetCurrentWeatherUseCase(this.weatherRepository);

  @override
  // ignore: avoid_renaming_method_parameters
  Future<DataState<CurrentCityEntity>> call(String cityName){
    return weatherRepository.fetchCurrentWeatherData(cityName);

  }
}
