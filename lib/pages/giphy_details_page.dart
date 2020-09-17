import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share/share.dart';

class GiphyDetailsPage extends StatefulWidget {
  final giphy;

  GiphyDetailsPage(this.giphy);

  @override
  GiphyDetailsPageState createState() => GiphyDetailsPageState();
}

class GiphyDetailsPageState extends State<GiphyDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: <Widget>[
          GestureDetector(
              onTap: () {
                Share.share(widget.giphy["images"]["fixed_height"]["url"]);
              },
              child: Icon(Icons.share))
        ],
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.network(widget.giphy["images"]["fixed_height"]["url"]),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90.0, vertical: 10),
                child: Text(widget.giphy["title"], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
