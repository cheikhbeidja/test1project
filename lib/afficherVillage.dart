import 'package:elwa6an/addEducation.dart';
import 'package:elwa6an/afficherEducation.dart';
import 'package:flutter/material.dart';
import '/models/village.dart';

//import 'dart:async';
import 'addvillage.dart';
//import 'afficherVillage.dart';
import 'modifierEducation.dart';
import 'modifierVillage.dart';
import 'utils/database.dart';

class Village extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return afficherVillage();
  }
}

class afficherVillage extends State<Village> {
  @override
  Widget build(BuildContext context) {
    final idc = ModalRoute.of(context)!.settings.arguments.toString();

    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text('village'),
        backgroundColor: Colors.deepPurple,
      ),
      body: new Container(
        padding: new EdgeInsets.all(16.0),
        child: new FutureBuilder<List<village>>(
            future: DBvillages.db.getVillage(idc),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return new ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return new Column(children: <Widget>[
                        new ListTile(
                          title:
                              new Text(snapshot.data![index].nom_administratif),
                          onTap: () async {
                            final test = await DBvillages.db
                                .queryVillageInfo(snapshot.data![index].id);
                            int length = test.length;
                            if (length == 0) {
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddVillage(),
                                      settings: RouteSettings(
                                        arguments: snapshot.data![index],
                                      ),
                                    ));
                              });
                            } else
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          modifierVillageInfo(),
                                      settings: RouteSettings(
                                        arguments: snapshot.data![index],
                                      ),
                                    ));
                              });
                          },
                          onLongPress: () {
                            showDialog<Null>(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return new AlertDialog(
                                      title: new Text('Ajouter à'),
                                      actions: [
                                        new FlatButton(
                                          child: new Center(
                                            child: new Text('Education'),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Education(),
                                                    settings: RouteSettings(
                                                      arguments: snapshot
                                                          .data![index].id,
                                                    ),
                                                  ));
                                            });
                                          },
                                          color: Colors.indigo,
                                        ),
                                        new FlatButton(
                                          child: new Center(
                                            child: new Text('Sante'),
                                          ),
                                          onPressed: () {},
                                          color: Colors.indigo,
                                        ),
                                        new FlatButton(
                                          child: new Center(
                                            child: new Text('hydrolique'),
                                          ),
                                          onPressed: () {},
                                          color: Colors.indigo,
                                        ),
                                      ]);
                                });
                          },
                        )
                      ]);
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
