class NewsModel {
  List data;

  NewsModel({required this.data});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    List fullData;
    fullData = json["articles"].map((news) {
      return {
        "image": news["urlToImage"],
        "description": news["description"],
        "title": news["title"],
      };
    }).toList();
    return NewsModel(data: fullData);
  }
}
