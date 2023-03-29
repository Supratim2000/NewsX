import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:newsx/models/EachNewsModel.dart';
import 'package:newsx/utils/NewsFetcherFromApi.dart';
import 'package:newsx/views/EachNewsView.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<StatefulWidget> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  bool _isLoading = true;

  List<EachNewsModel> fetchedNewsList = <EachNewsModel>[];

  void getNews() async {
    NewsFetcherFromApi newsFetcherFromApi = NewsFetcherFromApi();
    await newsFetcherFromApi.getNewsItems();
    fetchedNewsList = newsFetcherFromApi.newsList;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading?const Scaffold (
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox (
          height: 100.0,
          width: 100.0,
          child: CircularProgressIndicator (
            color: Colors.white,
            backgroundColor: Colors.blue,
            strokeWidth: 10.0,
          ),
        ),
      ),
    ) : Scaffold (
      backgroundColor: Colors.white,
      body:
      PageView.builder (
          controller: PageController(initialPage: 0),
          scrollDirection: Axis.vertical,
          itemCount: fetchedNewsList.length,
          itemBuilder: (context, index) {
            return EachNewsView (
              imageUrl: fetchedNewsList[index].urlToImage,
                heading: fetchedNewsList[index].title,
              description: fetchedNewsList[index].description,
              content: fetchedNewsList[index].content,
              articleUrl: fetchedNewsList[index].url
            );
          }
      )
    );
  }
}