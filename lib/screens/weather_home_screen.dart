import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_application/utils/utils.dart';
import 'package:weather_application/widgets/my_card.dart';

import '../controllers/weather_controller.dart';

class HomeScreen extends StatelessWidget {
  final WeatherController _weatherController = Get.put(WeatherController());


  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.blueGrey,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              height: size.height * 0.6,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey.withOpacity(0.7),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.white70,
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 5))
                  ]),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.plus_one),
                      Text('${_weatherController.weatherModelResponse.value.location?.country}, ${_weatherController.weatherModelResponse.value.location?.name}',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
                      IconButton(onPressed:(){}, icon: Icon(Icons.menu))
                      // Text('${_weatherController.weatherModelResponse.value.current!.condition!.icon}')
              ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Padding(
                        padding: EdgeInsets.only(top: 18.0),
                        child: Text(
                          '${_weatherController.weatherModelResponse.value.current?.tempC}',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      Text('o'),
                      Padding(
                        padding: EdgeInsets.only(top: 18.0),
                        child: Text('C',style: TextStyle(fontSize: 25),),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text('Feels Like '),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          '${_weatherController.weatherModelResponse.value.current?.feelslikeC}',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        'o',
                        style: TextStyle(fontSize: 10),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text('C'),
                      )
                    ],
                  ),
                  SizedBox(height: 100,),
                  Divider(color: Colors.white,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Latitude   ${_weatherController.weatherModelResponse.value.location?.lat}'),
                      Text('Longitude   ${_weatherController.weatherModelResponse.value.location?.lat}'),
                      Text('Last Updated   ${_weatherController.weatherModelResponse.value.current?.lastUpdated}'),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 130,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MyCard(title: 'humidity', value: '${_weatherController.weatherModelResponse.value.current?.humidity}'),
                  MyCard(title: 'wind speed', value: '${_weatherController.weatherModelResponse.value.current?.windKph}'),
                  MyCard(title: 'wind Direction', value: '${_weatherController.weatherModelResponse.value.current?.windDir}'),
                  MyCard(title: 'cloud', value: '${_weatherController.weatherModelResponse.value.current?.cloud}'),
                  MyCard(title: 'UV', value: '${_weatherController.weatherModelResponse.value.current?.uv}'),
                  MyCard(title: 'cloud', value: '${_weatherController.weatherModelResponse.value.current?.cloud}'),
                  MyCard(title: 'cloud', value: '${_weatherController.weatherModelResponse.value.current!.cloud}')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
