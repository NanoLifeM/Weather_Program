
// ignore_for_file: eol_at_end_of_file

import 'package:floor/floor.dart';

import 'package:weather_program/features/feature_bookmark/domain/entities/city_entity.dart';

@dao
abstract class CityDao{
  @Query('SELECT * FROM City')
  Future<List<City>> getAllCity();

  @Query('SELECT * FROM City WHERE name = :name')
  Future<City?> findCityByName(String name);

  @insert
  Future<void> insertCity(City city);

  @Query('DELETE FROM City WHERE name = :name')
  Future<void> deleteCityByName(String name);
}