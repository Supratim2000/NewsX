import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  String articleUrl;
  ArticleView({super.key, required this.articleUrl});

  @override
  State<StatefulWidget> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SizedBox (
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack (
              children: <Widget> [
                const Center(
                  child: SizedBox (
                  height: 100.0,
                  width: 100.0,
                  child: CircularProgressIndicator (
                    strokeWidth: 10.0,
                    color: Colors.blueAccent,
                    backgroundColor: Colors.blueGrey,
                  ),
              ),
                ),
                WebView (
                  initialUrl: widget.articleUrl,
                  onWebViewCreated: ((WebViewController WebViewController) {
                    _completer.complete(WebViewController);
                  }),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}