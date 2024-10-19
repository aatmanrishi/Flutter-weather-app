class WeatherModel {
  final Request? request;
  final Location? location;
  final Current? current;

  WeatherModel({this.request, this.location, this.current});

  WeatherModel.fromJson(Map<String, dynamic> json)
      : request = json['request'] != null ? Request.fromJson(json['request']) : null,
        location = json['location'] != null ? Location.fromJson(json['location']) : null,
        current = json['current'] != null ? Current.fromJson(json['current']) : null;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (request != null) {
      data['request'] = request!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (current != null) {
      data['current'] = current!.toJson();
    }
    return data;
  }
}

class Request {
  final String? type;
  final String? query;
  final String? language;
  final String? unit;

  Request({this.type, this.query, this.language, this.unit});

  Request.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        query = json['query'],
        language = json['language'],
        unit = json['unit'];

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'query': query,
      'language': language,
      'unit': unit,
    };
  }
}

class Location {
  final String? name;
  final String? country;
  final String? region;
  final String? lat;
  final String? lon;
  final String? timezoneId;
  final String? localtime;
  final int? localtimeEpoch;
  final String? utcOffset;

  Location({
    this.name,
    this.country,
    this.region,
    this.lat,
    this.lon,
    this.timezoneId,
    this.localtime,
    this.localtimeEpoch,
    this.utcOffset,
  });

  Location.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        country = json['country'],
        region = json['region'],
        lat = json['lat'],
        lon = json['lon'],
        timezoneId = json['timezone_id'],
        localtime = json['localtime'],
        localtimeEpoch = json['localtime_epoch'],
        utcOffset = json['utc_offset'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'country': country,
      'region': region,
      'lat': lat,
      'lon': lon,
      'timezone_id': timezoneId,
      'localtime': localtime,
      'localtime_epoch': localtimeEpoch,
      'utc_offset': utcOffset,
    };
  }
}

class Current {
  final String? observationTime;
  final int? temperature;
  final int? weatherCode;
  final List<String>? weatherIcons;
  final List<String>? weatherDescriptions;
  final int? windSpeed;
  final int? windDegree;
  final String? windDir;
  final int? pressure;
  final int? precip;
  final int? humidity;
  final int? cloudcover;
  final int? feelslike;
  final int? uvIndex;
  final int? visibility;

  Current({
    this.observationTime,
    this.temperature,
    this.weatherCode,
    this.weatherIcons,
    this.weatherDescriptions,
    this.windSpeed,
    this.windDegree,
    this.windDir,
    this.pressure,
    this.precip,
    this.humidity,
    this.cloudcover,
    this.feelslike,
    this.uvIndex,
    this.visibility,
  });

  Current.fromJson(Map<String, dynamic> json)
      : observationTime = json['observation_time'],
        temperature = json['temperature'],
        weatherCode = json['weather_code'],
        weatherIcons = (json['weather_icons'] as List?)?.map((item) => item as String).toList(),
        weatherDescriptions = (json['weather_descriptions'] as List?)?.map((item) => item as String).toList(),
        windSpeed = json['wind_speed'],
        windDegree = json['wind_degree'],
        windDir = json['wind_dir'],
        pressure = json['pressure'],
        precip = json['precip'],
        humidity = json['humidity'],
        cloudcover = json['cloudcover'],
        feelslike = json['feelslike'],
        uvIndex = json['uv_index'],
        visibility = json['visibility'];

  Map<String, dynamic> toJson() {
    return {
      'observation_time': observationTime,
      'temperature': temperature,
      'weather_code': weatherCode,
      'weather_icons': weatherIcons,
      'weather_descriptions': weatherDescriptions,
      'wind_speed': windSpeed,
      'wind_degree': windDegree,
      'wind_dir': windDir,
      'pressure': pressure,
      'precip': precip,
      'humidity': humidity,
      'cloudcover': cloudcover,
      'feelslike': feelslike,
      'uv_index': uvIndex,
      'visibility': visibility,
    };
  }
}
