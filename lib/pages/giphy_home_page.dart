import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:my_giphy/widgets/giphys_list_widget.dart';

class GiphyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GiphyHomePageState();
}

class GiphyHomePageState extends State<GiphyHomePage> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset('assets/gifs/giphy_developers_logo.gif'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              onFieldSubmitted: (value) {
                setState(() {
                  _searchController.text = value;
                });
              },
              controller: _searchController,
              decoration: InputDecoration(
                  labelText: "Pesquisa",
                  labelStyle: TextStyle(color: Colors.white),
                  suffixIcon: _searchController.text != ""
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              _searchController.clear();
                            });
                          },
                          child: Icon(
                            Icons.clear,
                            color: Colors.white,
                          ))
                      : Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ))),
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            GiphysListWidget(_searchController.text, 0)
          ],
        ),
      ),
    );
  }
}
