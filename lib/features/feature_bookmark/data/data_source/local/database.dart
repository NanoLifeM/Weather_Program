// ignore_for_file: depend_on_referenced_packages, eol_at_end_of_file

import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:weather_program/features/feature_bookmark/data/data_source/local/city_dao.dart';
import 'package:weather_program/features/feature_bookmark/domain/entities/city_entity.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [City])
abstract class AppDatabase extends FloorDatabase {
  CityDao get cityDao;
}