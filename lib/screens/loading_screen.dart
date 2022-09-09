import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'city_screen.dart';

const apiKey = '5842acaa2e1410059b4e24ca809896a4';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = 1.00;
  double longitude = 1.00;

  Future getLocationData() async {
    WeatherModel W1 = WeatherModel();

    var dataCollected = await W1.getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(dataCollected);
        },
      ),
    );

    // isko jab maine function ke bahar likha tab ye work kyu nahi kar raha tha?

    // what is builder, context, phele argument me context kyu tha ?

    return dataCollected;
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitPouringHourGlassRefined(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}














// imports me farak bhi puchiyo ek baar
// ki 'as http' kya kar raha hai yaha, aur why did angela not use it
// aur ye bhi ki without 'as http' karne pe ye mujhe
// ye kyu nahi khe raha ki maine same library do baar import kar li hai
// usme already included nahi hai vo?

// void getData() async {
  //   // print('test1');
  //   // Future<http.Response> fetchAlbum() {
  //   //   print('test3');
  //   //   return http.get(Uri.https('https://api.openweathermap.org/',
  //   //       'data/2.5/weather?lat=35&lon=139&appid=5842acaa2e1410059b4e24ca809896a4'));
  //   // }

  //   // print('test');

  //   // print(await http.read(Uri.https('api.openweathermap.org/',
  //   //     'data/2.5/weather?lat=35&lon=139&appid=5842acaa2e1410059b4e24ca809896a4')));


  //   var url = 'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=5842acaa2e1410059b4e24ca809896a4';
  // var response = await http.post(url, body: {'name': 'doodle', 'color': 'blue'});
  // print('Response status: ${response.statusCode}');
  // print('Response body: ${response.body}');

  // print(await http.read('https://example.com/foobar.txt'))
  // }





 // void getData() async {
    

  //     // var temperature = jsonDecode(data)['main']['temp'];
  //     // print(temperature);

  //     // var id = jsonDecode(data)['weather'][0]['id'];
  //     // print(id);

  //     // var city_name = jsonDecode(data)['name'];
  //     // print(city_name);
  //   } 
  // }