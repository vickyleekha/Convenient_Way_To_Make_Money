import 'dart:developer';
import 'package:convenient_thought/Images.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'RestClient.g.dart';

// const String BASE_URL =
//     "https://easysol.co.in/EsAndroidCloudAPI/EsAndroidCloudAPI.svc";

const String BASE_URL = "https://api.backendless.com/DF5BEC9F-AD65-E57E-FF54-82E514071F00/8F60DB66-643C-4E11-9EF3-CFFBBE86800B";

// https://api.backendless.com/DF5BEC9F-AD65-E57E-FF54-82E514071F00/8F60DB66-643C-4E11-9EF3-CFFBBE86800B/data/ValueLessons?pageSize=84&sortBy=%60id%60%20desc

@RestApi(baseUrl: BASE_URL)
abstract class RestClient {
  factory RestClient({String? baseUrl}) {
    Dio dio = Dio();
    dio.options = BaseOptions(
        receiveTimeout: 50000, connectTimeout: 50000, baseUrl: BASE_URL);
    dio.options.headers["Content-Type"] = "application/json";

    dio.interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true));
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      log("interceptor${response.data}");
      return handler.next(response);
    }, onError: (DioError e, handler) {
      return handler.next(e);
    }));
    return _RestClient(dio, baseUrl: baseUrl);
  }

  // @POST("/api/Easysol_Customer")
  // Future<Customer> getUser(@Body() User user);

  @GET("/data{path}")
  Future<List<Images>> getImages(@Path("path") String path);


}

