class Weather {
  final String cityName;
  final double temperature;
  final String weatherCondition;
  final double windSpeed;
  final int humidity;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.weatherCondition,
    required this.windSpeed,
    required this.humidity,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      weatherCondition: json['weather'][0]['main'],
      windSpeed: json['wind']['speed'].toDouble(),
      humidity: json['main']['humidity'],
    );
  }
}
