import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../core/constants/app_constants.dart';
import '../models/country_model.dart';

class HomeApis {
  late Response response;
  var dio = Dio();

  Future<List<Countries>> getCountryList() async {
    try {
      List<Countries> res = [];
      response = await dio.get('${AppConstans.baseUrl}all');
      if (response.statusCode == 200) {
        res = countryFromJson(json.encode(response.data));
        return res;
      } else {
        res = _response(response);
      }
      return res;
    } on SocketException {
      throw 'No Internet connection';
    }
  }
}

dynamic _response(Response response) {
  switch (response.statusCode) {
    case 400:
      throw response.data.toString();
    case 401:
    case 403:
      throw response.data.toString();
    case 500:
    default:
      throw 'Error occured while Communication with Server with StatusCode: ${response.statusCode}';
  }
}
