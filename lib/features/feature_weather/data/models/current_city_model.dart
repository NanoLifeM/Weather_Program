// ignore_for_file: avoid_dynamic_calls

import 'package:weather_program/features/feature_weather/domain/entities/current_city_entity.dart';

/// coord : {"lon":10.99,"lat":44.34}
/// weather : [{"id":501,"main":"Rain","description":"moderate rain","icon":"10d"}]
/// base : "stations"
/// main : {"temp":298.48,"feels_like":298.74,"temp_min":297.56,"temp_max":300.05,"pressure":1015,"humidity":64,"sea_level":1015,"grnd_level":933}
/// visibility : 10000
/// wind : {"speed":0.62,"deg":349,"gust":1.18}
/// rain : {"1h":3.16}
/// clouds : {"all":100}
/// dt : 1661870592
/// sys : {"type":2,"id":2075663,"country":"IT","sunrise":1661834187,"sunset":1661882248}
/// timezone : 7200
/// id : 3163858
/// name : "Zocca"
/// cod : 200

class CurrentCityModel extends CurrentCityEntity {
  const CurrentCityModel({
    super.coord,
    super.weather,
    super.base,
    super.main,
    super.visibility,
    super.wind,
    super.clouds,
    super.dt,
    super.sys,
    super.timezone,
    super.id,
    super.name,
    super.cod,
  });

  factory CurrentCityModel.fromJson(dynamic json) {
    final List<Weather> weather = [];
    if (json['weather'] != null) {
      json['weather'].forEach((v) {
        weather.add(Weather.fromJson(v));
      });
    }
    return CurrentCityModel(
      coord: json['coord'] != null ? Coord.fromJson(json['coord']) : null,
      weather: weather,
      base: json['base'],
      main: json['main'] != null ? Main.fromJson(json['main']) : null,
      visibility: int.parse(json['visibility'].toString()),
      wind: json['wind'] != null ? Wind.fromJson(json['wind']) : null,
      clouds: json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null,
      dt: int.parse(json['dt'].toString()),
      sys: json['sys'] != null ? Sys.fromJson(json['sys']) : null,
      timezone: int.parse(json['timezone'].toString()),
      id: int.parse(json['id'].toString()),
      name: json['name'],
    );
  }
}

/// type : 2
/// id : 2075663
/// country : "IT"
/// sunrise : 1661834187
/// sunset : 1661882248

class Sys {
  Sys({ this.country, this.sunrise, this.sunset});

  Sys.fromJson(dynamic json) {
    country = json['country'];
    sunrise = int.parse(json['sunrise'].toString());
    sunset = int.parse(json['sunset'].toString());
  }



  String? country;
  int? sunrise;
  int? sunset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['country'] = country;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    return map;
  }
}

/// all : 100

class Clouds {
  Clouds({this.all});

  Clouds.fromJson(dynamic json) {
    all = int.parse(json['all'].toString());
  }

  int? all;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['all'] = all;
    return map;
  }
}

/// 1h : 3.16

/// speed : 0.62
/// deg : 349
/// gust : 1.18

class Wind {
  Wind({this.speed, this.deg});

  Wind.fromJson(dynamic json) {
    speed = double.parse(json['speed'].toString());
    deg = int.parse(json['deg'].toString());
  }

  double? speed;
  int? deg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = speed;
    map['deg'] = deg;
    return map;
  }
}

/// temp : 298.48
/// feels_like : 298.74
/// temp_min : 297.56
/// temp_max : 300.05
/// pressure : 1015
/// humidity : 64
/// sea_level : 1015
/// grnd_level : 933

class Main {
  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  });

  Main.fromJson(dynamic json) {
    temp = double.parse(json['temp'].toString());
    feelsLike = double.parse(json['feels_like'].toString());
    tempMin = double.parse(json['temp_min'].toString());
    tempMax = double.parse(json['temp_max'].toString());
    pressure = int.parse(json['pressure'].toString());
    humidity = int.parse(json['humidity'].toString());
    seaLevel = int.parse(json['sea_level'].toString());
    grndLevel = int.parse(json['grnd_level'].toString());
  }

  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
  int? seaLevel;
  int? grndLevel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = temp;
    map['feels_like'] = feelsLike;
    map['temp_min'] = tempMin;
    map['temp_max'] = tempMax;
    map['pressure'] = pressure;
    map['humidity'] = humidity;
    map['sea_level'] = seaLevel;
    map['grnd_level'] = grndLevel;
    return map;
  }
}

/// id : 501
/// main : "Rain"
/// description : "moderate rain"
/// icon : "10d"

class Weather {
  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(dynamic json) {
    id = int.parse(json['id'].toString());
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  int? id;
  String? main;
  String? description;
  String? icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['main'] = main;
    map['description'] = description;
    map['icon'] = icon;
    return map;
  }
}

/// lon : 10.99
/// lat : 44.34

class Coord {
  Coord({this.lon, this.lat});

  Coord.fromJson(dynamic json) {
    lon = double.parse(json['lon'].toString());
    lat = double.parse(json['lat'].toString());
  }

  double? lon;
  double? lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = lon;
    map['lat'] = lat;
    return map;
  }
}
