class Weather {
  final String cityName;
  final double temperature;
  final String weatherCondition;
  final double windSpeed;
  final int humidity;
  final int rainChance;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.weatherCondition,
    required this.windSpeed,
    required this.humidity,
    required this.rainChance,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      weatherCondition: json['weather'][0]['main'],
      windSpeed: json['wind']['speed'].toDouble(),
      humidity: json['main']['humidity'],
      rainChance: ((json['pop'] ?? 0) * 100).round(),
    );
  }
}
