import 'dart:convert';

import 'package:newsx/models/EachNewsModel.dart';
import 'package:http/http.dart' as http;

class NewsFetcherFromApi {
  List<EachNewsModel> newsList = <EachNewsModel>[];
  final String newsUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=fded82696162458cba12cc419efd1f84';

  Future<void> getNewsItems() async{
    final Uri newsUri = Uri.parse(newsUrl);
    var response = await http.get(newsUri);
    print(response.body);
    dynamic jsonResponse = jsonDecode(response.body);
    if(jsonResponse['status'] == 'ok') {
      jsonResponse['articles'].forEach((eachNews) {
        if(eachNews['title'] != null && eachNews['description'] != null && eachNews['urlToImage'] != null && eachNews['content'] != null && eachNews['url'] != null) {
          EachNewsModel eachNewsModel = EachNewsModel(
              urlToImage: eachNews['urlToImage'],
              title: eachNews['title'],
              description: eachNews['description'],
              content: eachNews['content'],
              url: eachNews['url']);

          //Testing
          //print(eachNews['title']);
          newsList.add(eachNewsModel);
        }
      });
    }
  }

}