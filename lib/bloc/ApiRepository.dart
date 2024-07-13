
import 'package:convenient_thought/Images.dart';

import 'ApiProvider.dart';
import 'BaseModel.dart';

class ApiRepository {
  final _provider = ApiProvider();

  // Future<dynamic> fetchLogin(int code, String password) {
  //   return _provider.fetchLoginData(User(code: code, password: password));
  // }

  Future<BaseModel<List<Images>>> fetchSalesReport(String path) {
    return _provider.fetchSalesReport(path);
  }

  // Future<BaseModel<GetPharmacyLogin>> fetchChemistInfoList() {
  //   return _provider.fetchChemistInfoList(Globaldatabase.selectedCity);
  // }
}

class NetworkError extends Error {}
