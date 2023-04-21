import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/weather_screen/weather_screen.dart';
import '../app/app_controller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final cityController = TextEditingController();  //создание контролера

class _HomeScreenState extends State<HomeScreen> {
  void weather() {   //обрвботка исключений при ошибке получения данных
    final city = cityController.text;
    if (city.isNotEmpty) {
      Navigator.of(context).push( //переход на следующий экран
        MaterialPageRoute(
          builder: (context) => WeatherScreen(), 
        ),
      );
    } else {
      final snackBar = SnackBar(  //создание Снэк бара
        content: const Text('Data acquisition error'),
        action: SnackBarAction(
          label: 'To close',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    setState(() {});
  }

  Widget build(BuildContext context) {
    return GetBuilder<AppController>(  
      init: AppController(),
      initState: (_) {},
      builder: (app) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true, //расположение текста аппбара по центру
            title: const Text(
              'Enter the city',
              style: TextStyle(color: Colors.black), //стиль для текста
            ),
          ),
          body: Padding(  //задание ограничений(паддинга)
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .spaceAround, //расположение элементов по вертикали на одиноковом расстоянии
              children: [
                const Text('Enter the city to get the weather'),
                const Image(
                  image: AssetImage("assets/weather.png"),   //прикрепление изображения
                  width: 50,
                  height: 50,
                ),
                TextField(  //создание текстфилда
                  controller: cityController,
                  decoration: const InputDecoration(  
                    //параметры TextField
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    isCollapsed: true,
                  ),
                ),
                CupertinoButton(  //создание кнопки
                  child: Container(
                    height: 20, //ширина и высота кнопки
                    width: 100,
                    decoration: BoxDecoration(
                      //параметры кнопки
                      border: Border.all(
                        color: Colors.green,
                      ),
                      borderRadius: const BorderRadius.all(
                        //задается радиус кнопки
                        Radius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'OK',
                      textAlign:
                          TextAlign.center, //расположение текста по центру
                    ),
                  ),
                  onPressed: () async {  //действия при нажатии на копку
                    weather();
                    await app.getWeatherModel();
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
