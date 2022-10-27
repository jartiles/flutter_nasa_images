import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_nasa_images/models/apod_model.dart';

class NasaServices extends ChangeNotifier {
  final _baseUrl = 'api.nasa.gov';
  final _apiKey = 'YOUR-TOKEN';
  List<ApodModel> apodList = [];
  bool isLoading = false;

  NasaServices() {
    getApodImages(10);
  }

  set setActualPage(int index) {
    if (index >= apodList.length - 2) getApodImages(10);
  }

  Future getApodImages(int count) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, '/planetary/apod',
        {'count': '$count', 'thumbs': 'true', 'api_key': _apiKey});
    final response = await http.get(url);
    final responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      for (final Map<String, dynamic> res in responseBody) {
        apodList.add(ApodModel.fromMap(res));
      }
    }
    isLoading = false;
    notifyListeners();
  }

  Future reloadApodImages() async {
    apodList.clear();
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, '/planetary/apod',
        {'count': '10', 'thumbs': 'true', 'api_key': _apiKey});
    final response = await http.get(url);
    final responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      for (final Map<String, dynamic> res in responseBody) {
        apodList.add(ApodModel.fromMap(res));
      }
    }
    isLoading = false;
    notifyListeners();
  }
}
