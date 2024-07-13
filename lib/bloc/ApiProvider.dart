import 'package:convenient_thought/Images.dart';
import 'package:dio/dio.dart';

import '../retrofit/RestClient.dart';
import 'BaseModel.dart';
import 'ServerError.dart';

class ApiProvider {
  RestClient? apiClient;

  ApiProvider() {
    apiClient = RestClient();
  }

  // Future<BaseModel<Customer>> fetchLoginData(User user) async {
  //   Customer response;
  //   try {
  //     response = await apiClient!.getUser(user);
  //   } catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return BaseModel()
  //       ..setException(ServerError.withError(error: error as DioError));
  //   }
  //   return BaseModel()..data = response;
  // }

  Future<BaseModel<List<Images>>> fetchSalesReport(String path) async {
    dynamic response;
    try {
      response = await apiClient!.getImages(path);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return BaseModel()..data = response;
  }

  // Future<BaseModel<GetPharmacyLogin>> fetchChemistInfoList(String city) async {
  //   GetPharmacyLogin response;
  //   try {
  //     response = await apiClient!.getDistibutor(Distibutor(City: city));
  //   } catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return BaseModel()
  //       ..setException(ServerError.withError(error: error as DioError));
  //   }
  //   return BaseModel()..data = response;
  // }
}
