import 'package:elwa6an/models/Education.dart';
import 'package:elwa6an/models/village.dart';
import 'package:elwa6an/models/willaya.dart';
import 'package:elwa6an/utils/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import 'Home.dart';
import 'afficherVillage.dart';
import 'models/villageInfo.dart';
import 'modifierVillage.dart';

class AddEducation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return addEducation();
  }
}

class addEducation extends State<AddEducation> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    int idv = ModalRoute.of(context)!.settings.arguments as int;

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Ajoute Education à  '),
              backgroundColor: Colors.deepPurple,
            ),
            body: new Container(
                padding: new EdgeInsets.all(16.0),
                child: FormBuilder(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        FormBuilderTextField(
                          name: 'nom',
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.location_city,
                              color: Colors.green,
                            ),
                            hintText: "Enter le nom ",
                            labelText: "Nom",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 25),
                        FormBuilderTextField(
                          name: 'type',
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.space_dashboard_outlined,
                              color: Colors.indigo,
                            ),
                            hintText: "",
                            labelText: "type Education",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 25),
                        RaisedButton(
                          child: Text("Enregistre"),
                          onPressed: () {
                            formKey.currentState!.save();

                            education _education = education(
                              idv: idv,
                              nom: formKey.currentState!.value['nom'],
                              type: formKey.currentState!.value['type'],
                            );
                            DBvillages.db.insertEducation(_education);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => Home(),
                            //
                            //   ),
                            // );
                            print(_education);
                          },
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ))));
  }
}
