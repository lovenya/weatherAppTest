import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:clima/learn/Models/weatherModel.dart';

part 'weatherRetro.g.dart';

// https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}

@RestApi(baseUrl: 'https://api.openweathermap.org/data/2.5')
abstract class RestClient {
  factory RestClient(Dio.Dio dio, {String baseUrl}) = _RestClient;

  @GET("/weather")
  Future<String> getSpecificData(
    @Query("lat") String lat,
    @Query("lon") String lon,
    @Query("appid") String apiKey,
  );
}
