
import 'package:get/get.dart';
import 'package:weather_app/data/weather_model.dart';
import 'package:weather_app/home_screen/home_screen.dart';
import '../repository/repository.dart';
 class AppController extends GetxController {
  Repository repo = Repository();
  bool isLoading = false;
  String temp = '';
  String humidity = '';
  String speed = '';
  String tempMin = '';
  String tempMax = '';

  Future<void> getWeatherModel() async {
    isLoading = true;
    update();
    final WeatherModel res = await repo.getWeatherModel(cityController.text);
    temp = res.main!.temp.toString();
    humidity = res.main!.humidity.toString();
    speed = res.wind!.speed.toString();
    tempMin = res.main!.tempMin.toString();
    temp = res.main!.temp.toString();
    tempMax = res.main!.tempMax.toString();
    isLoading = false;
    update();
  }
 }