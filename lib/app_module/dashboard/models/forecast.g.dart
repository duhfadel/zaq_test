// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecast _$ForecastFromJson(Map<String, dynamic> json) => Forecast(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      generationtimeMs: (json['generationtime_ms'] as num?)?.toDouble(),
      utcOffsetSeconds: json['utc_offset_seconds'] as int?,
      timezone: json['timezone'] as String?,
      timezoneAbbreviation: json['timezone_abbreviation'] as String?,
      elevation: (json['elevation'] as num?)?.toDouble(),
      currentWeather: json['current_weather'] == null
          ? null
          : CurrentWeather.fromJson(
              json['current_weather'] as Map<String, dynamic>),
      hourlyUnits: json['hourly_units'] == null
          ? null
          : HourlyUnits.fromJson(json['hourly_units'] as Map<String, dynamic>),
      hourly: json['hourly'] == null
          ? null
          : Hourly.fromJson(json['hourly'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastToJson(Forecast instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('latitude', instance.latitude);
  writeNotNull('longitude', instance.longitude);
  writeNotNull('generationtime_ms', instance.generationtimeMs);
  writeNotNull('utc_offset_seconds', instance.utcOffsetSeconds);
  writeNotNull('timezone', instance.timezone);
  writeNotNull('timezone_abbreviation', instance.timezoneAbbreviation);
  writeNotNull('elevation', instance.elevation);
  writeNotNull('current_weather', instance.currentWeather?.toJson());
  writeNotNull('hourly_units', instance.hourlyUnits?.toJson());
  writeNotNull('hourly', instance.hourly?.toJson());
  return val;
}

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    CurrentWeather(
      temperature: (json['temperature'] as num?)?.toDouble(),
      windspeed: (json['windspeed'] as num?)?.toDouble(),
      winddirection: json['winddirection'] as num?,
      weathercode: json['weathercode'] as num?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('temperature', instance.temperature);
  writeNotNull('windspeed', instance.windspeed);
  writeNotNull('winddirection', instance.winddirection);
  writeNotNull('weathercode', instance.weathercode);
  writeNotNull('time', instance.time);
  return val;
}

Hourly _$HourlyFromJson(Map<String, dynamic> json) => Hourly(
      time: (json['time'] as List<dynamic>?)?.map((e) => e as String).toList(),
      temperature2M: (json['temperature2_m'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$HourlyToJson(Hourly instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('time', instance.time);
  writeNotNull('temperature2_m', instance.temperature2M);
  return val;
}

HourlyUnits _$HourlyUnitsFromJson(Map<String, dynamic> json) => HourlyUnits(
      time: json['time'] as String?,
      temperature2M: json['temperature2_m'] as String?,
    );

Map<String, dynamic> _$HourlyUnitsToJson(HourlyUnits instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('time', instance.time);
  writeNotNull('temperature2_m', instance.temperature2M);
  return val;
}
