import 'package:elwa6an/addEducation.dart';
import 'package:elwa6an/modifierEducation.dart';
import 'package:flutter/material.dart';
import '/models/Education.dart';

//import 'dart:async';
//import 'addvillage.dart';
import 'afficherVillage.dart';
import 'utils/database.dart';

class Education extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return afficherEducation();
  }
}

class afficherEducation extends State<Education> {
  @override
  Widget build(BuildContext context) {
    final idv = ModalRoute.of(context)!.settings.arguments as int;

    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          title: new Text('Education '),
          backgroundColor: Colors.deepPurple,
        ),
        body: new Container(
          padding: new EdgeInsets.all(16.0),
          child: new FutureBuilder<List<education>>(
              future: DBvillages.db.queryEducation(idv),
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
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => modifierEducation(),
                                //     settings: RouteSettings(
                                //       arguments: snapshot.data![index].idv,
                                //     ),
                                //   ),
                                // );
                              },
                            ),
                          ],
                        );
                      });
                }
                return Container(
                  child: new Center(child: new Text('no data'),),
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.green,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEducation(),
                  settings: RouteSettings(
                    arguments: idv,
                  ),
                ),
              );
            }));
  }
}
