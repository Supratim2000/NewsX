import 'package:flutter/cupertino.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<StatefulWidget> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Hello World'));
  }
}