import 'package:flutter/material.dart';
import 'models/maughataa.dart';
import 'addvillage.dart';
import 'Home.dart';

import 'models/willaya.dart';
import 'dart:async';
import 'utils/database.dart';
import 'afficherCommune.dart';

class Maughataa extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return afficherMaughataa();
  }
}

class afficherMaughataa extends State<Maughataa> {
  @override
  Widget build(BuildContext context) {
    final idw = ModalRoute.of(context)!.settings.arguments;

    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text('Maughataa'),
        backgroundColor: Colors.deepPurple,
      ),
      body: new Container(
        padding: new EdgeInsets.all(16.0),
        child: new FutureBuilder<List<maughataa>>(
            future: DBvillages.db.getMaughataa(idw.toString()),
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
                                  builder: (context) => Commune(),
                                  settings: RouteSettings(
                                    arguments: snapshot.data![index].id,
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
