import 'package:flutter/material.dart';
import 'package:newssearch/Models/news_model.dart';
import 'package:newssearch/Services/news_service.dart';

class NewsProviders extends ChangeNotifier {
  NewsModel? model;

  Future<void> fetchApi({required String category}) async {
    model = await NewsServices.getAll(category: category);
    notifyListeners();
  }
}
