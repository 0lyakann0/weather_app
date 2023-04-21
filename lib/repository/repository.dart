
import 'package:dio/dio.dart';
import '../data/weather_model.dart';

class Repository {
 
  final Dio dio = Dio();
  Future<WeatherModel> getWeatherModel(String text) async {
    final res = await dio.get('http://api.openweathermap.org/data/2.5/weather?q=$text&mode=json&appid=f83bbf6f7e9319018eebaade95d434b8');
    return WeatherModel.fromJson(res.data);
  }

}

