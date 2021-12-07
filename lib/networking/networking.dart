import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_api_test/models/data_model.dart';
import 'package:http/http.dart' as http;

class Networking extends ChangeNotifier {
  int length = 0;

  // the method below is used to get the data from the api
  Future<List<DataModel>?> getData() async {
    http.Response response = await http.get(
      Uri.parse(
        "https://api.publicapis.org/entries",
      ),
    );

    try {
      if (response.statusCode == 200) {
        // the below line of code is for debugging purpose
        // debugPrint("The response from the api is: ${response.body}");

        // dataLength(jsonDecode(response.body)['count']);

        Map<String, dynamic> map = jsonDecode(response.body);

        List data = map['entries'];

        // print(data[0]['API']);

        return data.map((e) => DataModel.fromJson(e)).toList();
      } else {
        // the below line of code is for printing the error
        // debugPrint("The error is: ${response.body}");
      }
    } catch (e) {
      // the below line of code is for debugging purpose
      // debugPrint("The error is: $e");
    }

    void dataLength(int num) {
      length = num;
      notifyListeners();
    }
  }
}
