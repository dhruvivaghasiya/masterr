import 'dart:convert';

import 'package:mvvm_structur/Apiservices/ApiRoute/apiroutes.dart';
import 'package:mvvm_structur/Apiservices/api_handlers.dart';

import '../../Model/Responce/product_responce_model.dart';

class GetproductRepo {
  static Future<ProductResponceModel> getproductRepo() async {
    var response = await ApiService()
        .getResponse(apiType: APIType.aGet, url: ApiRoutes.products);

    print('RESPONSE $response');

    ProductResponceModel Productresponcemodel =
        productResponceModelFromJson(jsonEncode(response));

    return Productresponcemodel;
  }
}
