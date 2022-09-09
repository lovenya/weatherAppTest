import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
//import 'package:clima/screens/loading_screen.dart';
import 'package:clima/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen(this.locationWeather);
  final locationWeather;

  // ye itna kyu karna pada, seedha state wale me nahi daal sakte ?
  // phele yaha karna zruri tha, koi khas vajah rahi iske peeche ?

  @override
  _LocationScreenState createState() => _LocationScreenState();

  // what is this line of code actually doing ?
  // making a state of locationscreen? But what does that mean ?

}

// var data =  getLocationData();
//   var temperature = dataCollected['main']['temp'];
//   var id = dataCollected['weather'][0]['id'];
//   var city_name = dataCollected['name'];

// print(temperature);
// print(id);
// print(city_name);

class _LocationScreenState extends State<LocationScreen> {
  // var weatherData = widget.locationWeather;
  // ye kyu nahi chal raha? build me jaanega ye
  // widget. se ham upar wali ki properties, methods ko access kar sakte hai na?
  // par vaise hamne vo upar kara hi kyu?
  // yaha direct nahi kar sakte the ?

  WeatherModel W1 = WeatherModel();

  double temp1 = 1.00; // = weatherData['main']['temp'];
  var id; // = weatherData['weather'][0]['id'];
  var city_name; //= weatherData['name'];
  var temperature;
  // yaha ise phele initialise karne ki zrurat kyu padi?

  String weatherIcon = 'test declaration';
  String weatherMessage = 'test init';

  // phele maine int temperature = 1 kara tha to 1 hi aa raha tha screen par
  // maine jab hot restart mara tab null aa raha tha, par dobara reload kiya to value aa rahi hai

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      temp1 = weatherData['main']['temp'];
      temperature = temp1.toInt();
      var ID = weatherData['weather'][0]['id']; // I even tried async await
      weatherIcon = W1.getWeatherIcon(ID);
      weatherMessage = W1.getMessage(temperature);
      city_name = weatherData['name']; // so that it doesn't return null
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/location_background.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.dstATop),
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(
                        onPressed: () async {
                          var weather_data = await W1.getLocationWeather();
                          updateUI(weather_data);
                        },
                        child: Icon(
                          Icons.near_me,
                          size: 40.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          var received_city_name = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CityScreen();
                              },
                            ),
                          );

                          if (received_city_name != null) {
                            var weatherData =
                                await W1.get_weather_city(received_city_name);
                            updateUI(weatherData);
                          }
                          //await updateUI(received_city_name);
                        },
                        child: Icon(
                          Icons.location_city,
                          size: 50.0,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '$temperature',
                          style: kTempTextStyle,
                        ),
                        Text(
                          weatherIcon,
                          style: kConditionTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 25.0, bottom: 15.0),
                    child: Text(
                      "$weatherMessage in $city_name",
                      textAlign: TextAlign.right,
                      style: kMessageTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
