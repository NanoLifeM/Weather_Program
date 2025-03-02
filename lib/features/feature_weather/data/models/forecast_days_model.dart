// ignore_for_file: avoid_dynamic_calls, overridden_fields

import 'package:weather_program/features/feature_weather/domain/entities/forecast_days_entity.dart';

// ignore: must_be_immutable
class ForecastDaysModel extends ForecastDaysEntity {
  ForecastDaysModel({this.cod, this.message, this.cnt, this.daily, this.city})
    : super(cod: cod, message: message, cnt: cnt, daily: daily, city: city);

  factory ForecastDaysModel.fromJson(dynamic json) {
    List<Daily> myList = [];
    if (json['list'] != null) {
      myList = [];
      json['list'].forEach((v) {
        myList.add(Daily.fromJson(v));
      });
    }
    final ForecastDaysModel model = ForecastDaysModel(
      cod: json['cod'],
      message: int.parse(json['message'].toString()),
      cnt: int.parse(json['cnt'].toString()),
      daily: myList,
      city: json['city'] != null ? City.fromJson(json['city']) : null,
    );

    return model;
  }

  @override
  String? cod;
  @override
  int? message;
  @override
  int? cnt;
  @override
  List<Daily>? daily;
  @override
  City? city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cod'] = cod;
    map['message'] = message;
    map['cnt'] = cnt;
    if (daily != null) {
      map['list'] = daily?.map((v) => v.toJson()).toList();
    }
    if (city != null) {
      map['city'] = city?.toJson();
    }
    return map;
  }
}

/// id : 3163858
/// name : "Zocca"
/// coord : {"lat":44.34,"lon":10.99}
/// country : "IT"
/// population : 4593
/// timezone : 7200
/// sunrise : 1661834187
/// sunset : 1661882248

class City {
  City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  City.fromJson(dynamic json) {
    id = int.parse(json['id'].toString());
    name = json['name'];
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    country = json['country'];
    population = int.parse(json['population'].toString());
    timezone = int.parse(json['timezone'].toString());
    sunrise = int.parse(json['sunrise'].toString());
    sunset = int.parse(json['sunset'].toString());
  }

  int? id;
  String? name;
  Coord? coord;
  String? country;
  int? population;
  int? timezone;
  int? sunrise;
  int? sunset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (coord != null) {
      map['coord'] = coord?.toJson();
    }
    map['country'] = country;
    map['population'] = population;
    map['timezone'] = timezone;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    return map;
  }
}

/// lat : 44.34
/// lon : 10.99

class Coord {
  Coord({this.lat, this.lon});

  Coord.fromJson(dynamic json) {
    lat = double.parse(json['lat'].toString());
    lon = double.parse(json['lon'].toString());
  }

  double? lat;
  double? lon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['lon'] = lon;
    return map;
  }
}

/// dt : 1661871600
/// main : {"temp":296.76,"feels_like":296.98,"temp_min":296.76,"temp_max":297.87,"pressure":1015,"sea_level":1015,"grnd_level":933,"humidity":69,"temp_kf":-1.11}
/// weather : [{"id":500,"main":"Rain","description":"light rain","icon":"10d"}]
/// clouds : {"all":100}
/// wind : {"speed":0.62,"deg":349,"gust":1.18}
/// visibility : 10000
/// pop : 0.32
/// rain : {"3h":0.26}
/// sys : {"pod":"d"}
/// dt_txt : "2022-08-30 15:00:00"

class Daily {
  Daily({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.pop,
    this.sys,
    this.dtTxt,
  });

  Daily.fromJson(dynamic json) {
    dt = int.parse(json['dt'].toString());
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = [];
      json['weather'].forEach((v) {
        weather?.add(Weather.fromJson(v));
      });
    }
    clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    pop = double.parse(json['pop'].toString());

    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    dtTxt = json['dt_txt'];
  }

  int? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  double? pop;
  Sys? sys;
  String? dtTxt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = dt;
    if (main != null) {
      map['main'] = main?.toJson();
    }
    if (weather != null) {
      map['weather'] = weather?.map((v) => v.toJson()).toList();
    }
    if (clouds != null) {
      map['clouds'] = clouds?.toJson();
    }
    if (wind != null) {
      map['wind'] = wind?.toJson();
    }
    map['pop'] = pop;
    if (sys != null) {
      map['sys'] = sys?.toJson();
    }
    map['dt_txt'] = dtTxt;
    return map;
  }
}

/// pod : "d"

class Sys {
  Sys({this.pod});

  Sys.fromJson(dynamic json) {
    pod = json['pod'];
  }

  String? pod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pod'] = pod;
    return map;
  }
}

/// 3h : 0.26



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
    map['speed'] = double.parse(speed.toString());
    map['deg'] = int.parse(deg.toString());
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

/// id : 500
/// main : "Rain"
/// description : "light rain"
/// icon : "10d"

class Weather {
  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(dynamic json) {
    id = json['id'];
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

/// temp : 296.76
/// feels_like : 296.98
/// temp_min : 296.76
/// temp_max : 297.87
/// pressure : 1015
/// sea_level : 1015
/// grnd_level : 933
/// humidity : 69
/// temp_kf : -1.11

class Main {
  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });

  Main.fromJson(dynamic json) {
    temp = double.parse(json['temp'].toString());
    feelsLike = double.parse(json['feels_like'].toString());
    tempMin = double.parse(json['temp_min'].toString());
    tempMax = double.parse(json['temp_max'].toString());
    pressure = int.parse(json['pressure'].toString());
    seaLevel = int.parse(json['sea_level'].toString());
    grndLevel = int.parse(json['grnd_level'].toString());
    humidity = int.parse(json['humidity'].toString());
    tempKf = double.parse(json['temp_kf'].toString());
  }

  double? temp;
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? seaLevel;
  int? grndLevel;
  int? humidity;
  double? tempKf;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = temp;
    map['feels_like'] = feelsLike;
    map['temp_min'] = tempMin;
    map['temp_max'] = tempMax;
    map['pressure'] = pressure;
    map['sea_level'] = seaLevel;
    map['grnd_level'] = grndLevel;
    map['humidity'] = humidity;
    map['temp_kf'] = tempKf;
    return map;
  }
}
