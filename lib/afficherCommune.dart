import 'package:flutter/material.dart';
import '/models/commune.dart';

//import 'dart:async';
//import 'addvillage.dart';
import 'afficherVillage.dart';
import 'utils/database.dart';

class Commune extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return afficherCommune();
  }
}

class afficherCommune extends State<Commune> {
  @override
  Widget build(BuildContext context) {
    final idm = ModalRoute.of(context)!.settings.arguments.toString();

    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text('commune'),
        backgroundColor: Colors.deepPurple,
      ),
      body: new Container(
        padding: new EdgeInsets.all(16.0),
        child: new FutureBuilder<List<commune>>(
            future: DBvillages.db.getCommune(idm),
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
                                  builder: (context) => Village(),
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
      /* floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: controle,
      ),*/
    );
  }
}
