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
          itemBuilder: (context, index) {
            return EachNewsView (
              imageUrl: 'https://images.unsplash.com/photo-1679939652424-adc25dd36887?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80',
              heading: 'Humanity is in danger if the world does not pause AI ‘experiments’, 1,000 experts including Elon Musk warn',
              description: 'Its going to revolutionize the game, says Baker. "Absorbing this [electricity] locally actually makes financial sense. Using appliances to complete the task is optimal. TWP Advice by Michael J. Coren, March 28, 2023 Your appliances, you should know, will com…',
              content: 'For free real time breaking news alerts sent straight to your inbox sign up to our breaking news emails\r\nSign up to our free breaking news emails\r\nHumanity is in danger from AI experiments and they m… [+2910 chars]',
              articleUrl: '"https://www.independent.co.uk/tech/ai-artifiical-intelligence-elon-musk-letter-b2309980.html'
            );
          }
      )
    );
  }
}