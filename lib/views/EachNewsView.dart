import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsx/views/ArticleView.dart';
import 'package:transparent_image/transparent_image.dart';

class EachNewsView extends StatelessWidget {
  String imageUrl;
  String heading;
  String description;
  String content;
  String articleUrl;

  EachNewsView ({
    super.key,
    required this.imageUrl,
    required this.heading,
    required this.description,
    required this.content,
    required this.articleUrl
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column (
        children: <Widget> [
          Container (
            height: 400.0,
            width: MediaQuery.of(context).size.width,
            child: Stack(
                children: <Widget> [
                  const Center(
                      child: SizedBox(
                        height: 100.0,
                        width: 100.0,
                        child: CircularProgressIndicator (
                          strokeWidth: 10.0,
                          color: Colors.blueAccent,
                          backgroundColor: Colors.blueGrey,
                        ),
                      )
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: FadeInImage.memoryNetwork(
                        height: 400.0,
                        width: MediaQuery.of(context).size.width,
                        placeholder: kTransparentImage,
                        image: imageUrl,
                        fit: BoxFit.cover,
                        alignment: Alignment.center
                    ),
                  ),
                ]
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text (
              heading,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle (
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoSlab',
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0,0.0,10.0,10.0),
            child: Text (
              description,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              style: const TextStyle (
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              )
            ),
          ),
          Padding (
            padding: const EdgeInsets.fromLTRB(10.0,0.0,10.0,10.0),
            child: Text (
              content,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style: TextStyle (
                fontSize: 14,
                color: Colors.grey.shade800,
                fontFamily: 'RobotoSlab'
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget> [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(articleUrl: articleUrl)));
                      },
                      child: const Text('Read More')
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}