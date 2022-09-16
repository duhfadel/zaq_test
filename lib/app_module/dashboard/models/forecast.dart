import 'package:json_annotation/json_annotation.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
    Forecast({
        this.latitude,
        this.longitude,
        this.generationtimeMs,
        this.utcOffsetSeconds,
        this.timezone,
        this.timezoneAbbreviation,
        this.elevation,
        this.currentWeather,
        this.hourlyUnits,
        this.hourly,
    });

    double? latitude;
    double? longitude;
    double? generationtimeMs;
    int? utcOffsetSeconds;
    String? timezone;
    String? timezoneAbbreviation;
    double? elevation;
    CurrentWeather? currentWeather;
    HourlyUnits? hourlyUnits;
    Hourly? hourly;

    factory Forecast.fromJson(Map<String, dynamic> json) =>
        _$ForecastFromJson(json);
    Map<String, dynamic> toJson() => _$ForecastToJson(this);
}

@JsonSerializable()
class CurrentWeather {
    CurrentWeather({
        this.temperature,
        this.windspeed,
        this.winddirection,
        this.weathercode,
        this.time,
    });

    double? temperature;
    double? windspeed;
    num? winddirection;
    num? weathercode;
    String? time;

    factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
        _$CurrentWeatherFromJson(json);
    Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);
}
@JsonSerializable()
class Hourly {
    Hourly({
        this.time,
        this.temperature2M,
    });

    List<String>? time;
    List<double>? temperature2M;
    factory Hourly.fromJson(Map<String, dynamic> json) =>
        _$HourlyFromJson(json);
    Map<String, dynamic> toJson() => _$HourlyToJson(this);
}
@JsonSerializable()
class HourlyUnits {
    HourlyUnits({
        this.time,
        this.temperature2M,
    });

    String? time;
    String? temperature2M;

    factory HourlyUnits.fromJson(Map<String, dynamic> json) =>
        _$HourlyUnitsFromJson(json);
    Map<String, dynamic> toJson() => _$HourlyUnitsToJson(this);
}