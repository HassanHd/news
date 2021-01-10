import 'package:cleennews/services/Api.dart';
import 'package:flutter/material.dart';
class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
          child: RaisedButton(
              onPressed: () async {
                NewsApi newsApi=NewsApi();
                var data=await newsApi.fetchArticles();
                for(var x in data){
                  print("title------------->"+x.title);
                }
              },
            child: Text("fetchData"),
          )),
    );
  }
}
