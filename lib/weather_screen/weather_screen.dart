import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/detailed_weather_screen/detailed_weather_screen.dart';
import '../app/app_controller.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      init: AppController(),
      initState: (_) {},
      builder: (app) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true, //расположение текста аппбара по центру
            title: const Text(
              //текст для апппбара
              'Weather',
              style: TextStyle(color: Colors.black), //стиль для текста
            ),
            leading: const BackButton(
                color: Colors.black), //кнопка для возвращения на прошлый экран
            actions: [
              IconButton(
                //кнопка, открывающая 3ий экран с погодой на 3 дня
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailedWeather(),
                    ),
                  );
                },
                icon: const Icon(
                  //иконка для кнопки
                  Icons.details_rounded,
                  color: Colors.black, //задание цвета для иконки
                ),
              )
            ],
          ),
          body: Container(
            padding: const EdgeInsets.all(20), //паддинг(отступ) со всех сторон
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .spaceAround, //расположение элементов по вертикали
              crossAxisAlignment: CrossAxisAlignment
                  .start, //расположение элементов по горизонтали
              children: [
                if (app.isLoading)
                  const CircularProgressIndicator()
                else
                  //данные о погоде в выбранном городе
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Temperature  " + app.temp),
                      Image.asset(
                        'assets/temperature.png',
                        width: 40,
                        height: 40,
                      ),
                    ],
                  ),
                if (app.isLoading)
                  const CircularProgressIndicator()
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Humidity  " + app.humidity),
                      Image.asset(
                        'assets/humidity.png',
                        width: 40,
                        height: 40,
                      ),
                    ],
                  ),
                if (app.isLoading)
                  const CircularProgressIndicator()
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Wind speed  " + app.speed),
                      Image.asset(
                        'assets/wind.png',
                        width: 40,
                        height: 40,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
