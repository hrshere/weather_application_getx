import 'package:http/http.dart' as http;

import '../utils/utils.dart';

class ApiService {
  static Future<http.Response> fetchWeatherDetailsApi(
      {String latitude = '28.7041', String longitude = '77.1025'}) async {
    final response = await http.get(
      Uri.parse(
          '${Constants.baseUrl}${Constants.apiKey}&q=$latitude,$longitude&aqi=no'),
    );

    return response;
  }
}
