import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_smooth/models/weather_model.dart';
import 'package:weather_smooth/services/weather_service.dart';
import 'package:weather_smooth/additional_items.dart';
import '../env/env.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // api key
  final _weatherService = WeatherService();
  Weather? _weather;

  // fetch weather
  Future<void> _fetchWeather() async {
    // get the current city
    String cityName = await _weatherService.getCurrentCity();

    // get weather for city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }
    //any errors
    catch (e) {
      print(e);
    }
  }

  // weather animations
  String getWeatherAnimation(String? weatherCondition) {
    if (weatherCondition == null) {
      return 'assets/loading.json'; // default to sunny
    }

    switch (weatherCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloudy.json';
      case 'drizzle':
      case 'shower rain':
        return 'assets/rainy.json';
      case 'rain':
      case 'thunderstorm':
        return 'assets/rainstorm.json';
      case 'snow':
        return 'assets/snow.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  // init state
  @override
  void initState() {
    super.initState();

    //fetch weather on startup
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final weekdayNames = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    final monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    final formattedDate =
        '${weekdayNames[now.weekday - 1]}, ${monthNames[now.month - 1]} ${now.day}';

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF4FA5F9), Color(0xFF1E60E8)],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.shade900,
                  spreadRadius: -10,
                  blurRadius: 30,
                  offset: Offset(0, 22),
                  blurStyle: BlurStyle.inner,
                ),
              ],
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on),
                            Text(
                              _weather?.cityName ?? "loading city..",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: _fetchWeather,
                          icon: Icon(Icons.refresh),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  Lottie.asset(getWeatherAnimation(_weather?.weatherCondition)),
                  Text(
                    '${_weather?.temperature.round()}°',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 80,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // weather condition
                  Text(
                    _weather?.weatherCondition ?? "",
                    style: TextStyle(fontSize: 25, fontFamily: 'Poppins'),
                  ),
                  Text(
                    formattedDate,
                    style: TextStyle(fontSize: 13, fontFamily: 'Poppins'),
                  ),

                  // The Divider
                  Container(
                    margin: EdgeInsets.all(20),
                    height: 0.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AdditionalItems(
                        icon: Icons.air_rounded,
                        value: '${_weather?.windSpeed.round() ?? 0} km/h',
                        label: 'Wind',
                      ),
                      AdditionalItems(
                        icon: Icons.water_drop_outlined,
                        value: '${_weather?.humidity ?? 0}%',
                        label: 'Humidity',
                      ),
                      AdditionalItems(
                        icon: Icons.umbrella_outlined,
                        value: '${_weather?.rainChance ?? 0}%',
                        label: 'Chance of rain',
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),

      // temperature
    );
  }
}

void fetchWeather() {
  final url = Env.baseUrl;
  final key = Env.apiKey;

  print('Connecting to $url with key $key');
}
