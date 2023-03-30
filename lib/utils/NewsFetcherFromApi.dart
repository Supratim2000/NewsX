import 'dart:convert';
import 'dart:math';

import 'package:newsx/models/EachNewsModel.dart';
import 'package:http/http.dart' as http;

class NewsFetcherFromApi {
  List<EachNewsModel> newsList = <EachNewsModel>[];
  final List<String> newsUrlList = <String>[];

  void addNewsUrlsToList() {
    newsUrlList.add('https://newsapi.org/v2/top-headlines?country=us&apiKey=fded82696162458cba12cc419efd1f84');
    newsUrlList.add('https://newsapi.org/v2/top-headlines?country=in&apiKey=fded82696162458cba12cc419efd1f84');
    newsUrlList.add('https://newsapi.org/v2/everything?domains=techcrunch.com,thenextweb.com&apiKey=fded82696162458cba12cc419efd1f84');
    newsUrlList.add('https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=fded82696162458cba12cc419efd1f84');
    newsUrlList.add('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=fded82696162458cba12cc419efd1f84');
  }

  Future<void> getNewsItems() async{
    addNewsUrlsToList();
    try {
      Random rand = Random();
      int randomIndex = rand.nextInt(newsUrlList.length);
      final Uri newsUri = Uri.parse(newsUrlList[randomIndex]);
      var response = await http.get(newsUri);
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
            newsList.add(eachNewsModel);
          }
        });
      }
    } on Exception catch (e) {
      print('Exception details:\n $e');
    } catch (e, s) {
      print('Exception details:\n $e');
      print('Stack trace:\n $s');
    }
  }
}