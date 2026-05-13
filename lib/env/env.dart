import 'package:envied/envied.dart';

part 'env.g.dart'; // This file will be generated automatically

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'OPENWEATHER_API_KEY', obfuscate: true)
  static final String apiKey = _Env.apiKey;

  @EnviedField(varName: 'BASE_URL')
  static const String baseUrl = _Env.baseUrl;
}
