import 'package:cleennews/%20basicswidget/custombutton.dart';
import 'package:cleennews/%20basicswidget/texttitel.dart';
import 'package:cleennews/services/Api.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  NewsApi newsApi=NewsApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                right: 20.0, left: 20.0, top: 30.0, bottom: 10.0),
            child: CustomText(
              alignment: Alignment.topLeft,
              fontSize: 36,
              color: textcolor,
              text: "Choose News Categories",
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 5.0, left: 5.0),
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child:
                  ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CustomButton(
                    color: blue,
                    text: "general",
                    colortext: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CustomButton(
                    color: yellow,
                    text: "science",
                    colortext: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CustomButton(
                    color: red,
                    text: "health",
                    colortext: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CustomButton(
                    color: yellow,
                    text: "business",
                    colortext: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CustomButton(
                    color: orangelight,
                    text: "sports",
                    colortext: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CustomButton(
                    color: blue,
                    text: "entertainment",
                    colortext: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: CustomButton(
                    color: orangedark,
                    text: "technology",
                    colortext: Colors.white,
                  ),
                ),
              ]),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                right: 20.0, left: 20.0, top: 30.0, bottom: 10.0),
            child: CustomText(
              alignment: Alignment.topLeft,
              fontSize: 22,
              color: textcolor,
              text: "Bast News",
            ),
          ),
          Expanded(
              child:Container(

                padding: EdgeInsets.only(right: 10.0,left: 10.0, bottom: 10.0),
                child: FutureBuilder(

    future:newsApi.fetchArticles(),
    builder: (BuildContext context, AsyncSnapshot async) {
      if (async.data == null) {
        return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.yellow,
            ));
      }
      else {
    return ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemCount: async.data.length,
    itemBuilder: (BuildContext context, int position){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Image.network(
              async.data[position].urlToImage,
              fit: BoxFit.cover,
              height: 200.0,
              width: double.infinity,
            ),
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.all(8.0),
          ),
          Container(
            padding: EdgeInsets.only(
                right: 8.0, left: 8.0),
            child: CustomText(
              alignment: Alignment.topLeft,
              fontSize: 14,
              color: textcolor,
              text: async.data[position].title,
            ),
          ),
        ],
      );
      });
    }} )
              )
          ),

          
        ],
      ),
    );
  }
}
