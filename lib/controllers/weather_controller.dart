import 'dart:convert';

import 'package:get/get.dart';

import '../models/weather_model.dart';
import '../services/weather_api_service.dart';

class WeatherController extends GetxController {
  Rx<WeatherModel> weatherModelResponse = WeatherModel().obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    fetchWeatherDetails();
  }

  fetchWeatherDetails() {
    ApiService.fetchWeatherDetailsApi().then((value) {
      if (value.statusCode == 200) {
        weatherModelResponse.value = WeatherModel.fromJson(jsonDecode(value.body));
      }
      return weatherModelResponse.value;
    });
  }
}
