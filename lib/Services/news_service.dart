import 'package:dio/dio.dart';
import 'package:newssearch/Models/news_model.dart';

class NewsServices {
  static Dio dio = Dio();

  static Future<NewsModel> getAll({required String category}) async {
    try {
      var url =
          "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=02a63347dba54e61ad8312004419737a";
      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        return NewsModel.fromJson(response.data);
      } else {
        throw ("404");
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}
