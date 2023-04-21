import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Theme/app_colors.dart';
import '../app/app_controller.dart';

class DetailedWeather extends StatefulWidget {
  DetailedWeather({Key? key}) : super(key: key);

  @override
  State<DetailedWeather> createState() => _DetailedWeatherState();
}

class _DetailedWeatherState extends State<DetailedWeather> {
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
              'Weather for 3 days',
              style: TextStyle(color: Colors.black), //стиль для текста
            ),
            leading: const BackButton(
                color: Colors.black), //кнопка для возвращения на прошлый экран
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),  //задание ограничений(паддинга)
            child: ListView(  //создание листа
              children: [
                if (app.isLoading)
                  const CircularProgressIndicator()
                else
                  Container(
                    alignment: Alignment.center, //выравнивания вложенного элемента
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(  //изменение параметров контейнера
                      color: AppColors.tempMin,
                      borderRadius: BorderRadius.all(
                        //задается радиус контейнера
                        Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround, //расположение элементов
                      children: [
                        Text(
                          app.tempMin,
                        ),
                        Image.asset("assets/tempMin.png",width: 30,height: 30,),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50,),
                if (app.isLoading)
                  const CircularProgressIndicator()
                else
                  Container(
                    alignment: Alignment.center, //выравнивания вложенного элемента
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: AppColors.temp,
                      borderRadius: BorderRadius.all(
                        //задается радиус контейнера
                        Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          app.temp,
                        ),
                        Image.asset("assets/temp.png",width: 30,height: 30,),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50,),
                if (app.isLoading)
                  const CircularProgressIndicator()
                else
                  Container(
                    alignment: Alignment.center, //выравнивания вложенного элемента
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: AppColors.tempMax,
                      borderRadius: BorderRadius.all(
                        //задается радиус контейнера
                        Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          app.tempMax,
                        ),
                        Image.asset("assets/tempMax.png",width: 30,height: 30,),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50,),
              ],
            ),
          ), //создание списка
        );
      },
    );
  }
}
