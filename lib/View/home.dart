import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm_structur/Apiservices/Repo/product_repo.dart';

import '../Model/Responce/product_responce_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key, this.id}) : super(key: key);
  final id;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future getData() async {
    var data;
    http.Response response =
        await http.get(Uri.parse("https://dummyjson.com/products"));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      print("RESPONCE CODE ${response.body}");
    } else {
      print("RESPONCE CODE ${response.statusCode}");
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ProductResponceModel>(
        future: GetproductRepo.getproductRepo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${snapshot.data!.products[0].id}"),
                  Text("${snapshot.data!.products[0].title}"),
                  Text("${snapshot.data!.products[0].description}"),
                  Text("${snapshot.data!.products[0].price}"),
                  Text("${snapshot.data!.products[0].discountPercentage}"),
                  Text("${snapshot.data!.products[0].rating}"),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
