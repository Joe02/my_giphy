import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_giphy/pages/giphy_details_page.dart';
import 'package:my_giphy/utils/giphy_controller.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

class GiphysListWidget extends StatefulWidget {
  final String search;
  final int offset;

  GiphysListWidget(this.search, this.offset);

  @override
  GiphysListWidgetState createState() => GiphysListWidgetState();
}

class GiphysListWidgetState extends State<GiphysListWidget> {
  final giphyController = GiphyController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: giphyController.getGifs(widget.search, widget.offset),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                );
              default:
                if (snapshot.hasError) {
                  return Container(
                    child: Text("Ocorreu um erro ao carregar os GIFs :("),
                  );
                } else {
                  return gifsGridList(context, snapshot);
                }
            }
          }),
    );
  }

  Widget gifsGridList(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
      itemCount: snapshot.data["data"].length,
      itemBuilder: (context, index) => GestureDetector(
          onLongPress: () {
            Share.share(
                snapshot.data["data"][index]["images"]["fixed_height"]["url"]);
          },
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GiphyDetailsPage(
                  snapshot.data["data"][index],
                ),
              ),
            );
          },
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: snapshot.data["data"][index]["images"]["fixed_height"]
                ["url"],
            height: 300,
            fit: BoxFit.cover,
          )),
    );
  }
}
