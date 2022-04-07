import 'package:flutter/material.dart';
import 'afficherMaughataa.dart';
import 'models/maughataa.dart';
import 'addvillage.dart';

import 'models/willaya.dart';
import 'dart:async';
import 'utils/database.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Homepage();
  }
}

class Homepage extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text('willaya'),
        backgroundColor: Colors.deepPurple,
      ),
      body: new Container(
        padding: new EdgeInsets.all(16.0),
        child: new FutureBuilder<List<willaya>>(
            future: DBvillages.db.getAllwillaya(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return new ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return new Column(
                        children: <Widget>[
                          new ListTile(
                            title: new Text(snapshot.data![index].nom),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Maughataa(),
                                  settings: RouteSettings(
                                    arguments:
                                        snapshot.data![index].id.toString(),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    });
              }
              return Container(
                alignment: AlignmentDirectional.center,
                child: new CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
