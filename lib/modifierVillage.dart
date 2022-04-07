import 'package:elwa6an/models/village.dart';
import 'package:elwa6an/models/willaya.dart';
import 'package:elwa6an/utils/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import 'Home.dart';
import 'addvillage.dart';
import 'afficherVillage.dart';
import 'models/villageInfo.dart';

class modifierVillageInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return modifierVillages();
  }
}

class modifierVillages extends State<modifierVillageInfo> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    village list = ModalRoute.of(context)!.settings.arguments as village;
    String name = list.nom_administratif;

    return  Scaffold(
            appBar: AppBar(
              title: Text('Modifier $name'),
              backgroundColor: Colors.deepPurple,
            ),
        body: new Container(
            padding: new EdgeInsets.all(16.0),
                child: new FutureBuilder<List<villageInfo>>(
                    future: DBvillages.db.queryVillageInfo(list.id),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return new ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return  FormBuilder(
                                    key: formKey,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: <Widget>[
                                          FormBuilderTextField(
                                            name: 'nom_local',
                                            initialValue:
                                                snapshot.data![index].nom_local,
                                            decoration: InputDecoration(
                                              icon: Icon(
                                                Icons.location_city,
                                                color: Colors.green,
                                              ),
                                              hintText: "Enter le nom local",
                                              labelText: "Nom local",
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(height: 25),
                                          FormBuilderTextField(
                                            name:
                                                'distance_par_rapport_au_chef_Lieu_de_la_commune',
                                            initialValue: snapshot.data![index]
                                                .distance_par_rapport_au_chef_Lieu_de_la_commune.toString()
                                                ,
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              icon: Icon(
                                                Icons.space_dashboard_outlined,
                                                color: Colors.indigo,
                                              ),
                                              hintText: "",
                                              labelText:
                                                  "Distance par rapport au chef_lieux de la commune",
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(height: 25),
                                          FormBuilderTextField(
                                            name:
                                                'diastance_par_rapport_aux_principaux',
                                            initialValue: snapshot.data![index].diastance_par_rapport_aux_principaux.toString(),
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              icon: Icon(
                                                Icons.social_distance,
                                                color: Colors.indigo,
                                              ),
                                              hintText: "",
                                              labelText:
                                                  "Distance par rapport au axe principaux",
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(height: 25),
                                          FormBuilderDateTimePicker(
                                            name: "date_de_creation",
                                            initialValue: DateTime.parse(snapshot.data![index].date_de_creation),
                                            inputType: InputType.date,
                                            format: DateFormat("dd-MM-yyyy"),
                                            decoration: InputDecoration(
                                              labelText: "Date de creation",
                                              icon: Icon(
                                                Icons.access_time,
                                                color: Colors.indigo,
                                              ),
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(height: 25),
                                          // FormBuilderCheckboxGroup(
                                          //   decoration: InputDecoration(
                                          //     labelText: "Composition Ethnique",
                                          //     labelStyle: TextStyle(
                                          //         fontWeight: FontWeight.bold,
                                          //         fontSize: 22),
                                          //     border: OutlineInputBorder(),
                                          //   ),
                                          //   name: "Composition_Ethnique",
                                          //   options: [
                                          //     FormBuilderFieldOption(
                                          //         value: "hasania"),
                                          //     FormBuilderFieldOption(value: "poular"),
                                          //     FormBuilderFieldOption(value: "sonké"),
                                          //     FormBuilderFieldOption(value: "autres")
                                          //   ],
                                          // ),
                                          SizedBox(height: 25),
                                          FormBuilderTextField(
                                            name: 'population_fixe',
                                            initialValue: snapshot.data![index].population_fixe.toString(),
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              icon: Icon(
                                                Icons.people_outlined,
                                                color: Colors.indigo,
                                              ),
                                              hintText: "",
                                              labelText: "population fixe",
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(height: 25),

                                          FormBuilderTextField(
                                            name: 'nombre_de_menages',
                                            initialValue: snapshot.data![index].nombre_de_menages.toString(),
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              icon: Icon(
                                                  Icons.confirmation_number),
                                              hintText: "",
                                              labelText: "Nomre de ménages",
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(height: 25),

                                          FormBuilderRadioGroup(
                                            name: "type_de_localite",
                                            initialValue: snapshot.data![index].type_de_localite,
                                            decoration: InputDecoration(
                                                labelText: "Type de localité ",
                                                border: OutlineInputBorder(),
                                                labelStyle: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22)),
                                            options: [
                                              FormBuilderFieldOption(
                                                  value: "pastoral"),
                                              FormBuilderFieldOption(
                                                  value:
                                                      "permanent non adminisratif"),
                                              FormBuilderFieldOption(
                                                  value: "adminisratif"),
                                              FormBuilderFieldOption(
                                                  value: "saisonnier"),
                                            ],
                                          ),
                                          SizedBox(height: 25),
                                          FormBuilderRadioGroup(
                                            name: "structure_de_habitat",
                                            initialValue: snapshot.data![index].structure_de_habitat,
                                            decoration: InputDecoration(
                                                labelText:
                                                    "Structure de l'habitat",
                                                border: OutlineInputBorder(),
                                                labelStyle: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22)),
                                            options: [
                                              FormBuilderFieldOption(
                                                  value: "dispersé"),
                                              FormBuilderFieldOption(
                                                  value: "regroupé"),
                                              FormBuilderFieldOption(
                                                  value: "urbain"),
                                              FormBuilderFieldOption(
                                                  value: "nomade"),
                                            ],
                                          ),
                                          SizedBox(height: 40),
                                          FormBuilderTextField(
                                            name: 'observation',
                                            initialValue: snapshot.data![index].observation,
                                            decoration: InputDecoration(
                                              icon: Icon(
                                                Icons.remove_red_eye,
                                                color: Colors.indigo,
                                              ),
                                              hintText:
                                                  "Observation sur l'accés à la localité",
                                              labelText: "Observation",
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(height: 25),
                                          FormBuilderTextField(
                                            name: 'nombre_de_familles_estime',
                                            initialValue: snapshot.data![index].nombre_de_familles_estime.toString(),
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              icon: Icon(
                                                Icons.family_restroom,
                                                color: Colors.indigo,
                                              ),
                                              hintText: "",
                                              labelText: "Familles estimé",
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(height: 25),
                                          FormBuilderTextField(
                                            name: 'population_estimee',
                                            initialValue: snapshot.data![index].population_estimee.toString(),
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              icon: Icon(
                                                Icons.people_outlined,
                                                color: Colors.indigo,
                                              ),
                                              hintText: "",
                                              labelText: "population estimé",
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(height: 25),
                                          FormBuilderTextField(
                                            name: 'annee_de_estimation',
                                            initialValue: snapshot.data![index].annee_de_estimation.toString(),
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              icon: Icon(
                                                Icons.more_time_sharp,
                                                color: Colors.indigo,
                                              ),
                                              hintText: "",
                                              labelText: "Année de lestimation",
                                              border: OutlineInputBorder(),
                                            ),
                                            maxLength: 4,
                                          ),
                                          SizedBox(height: 25),
                                          FormBuilderTextField(
                                            name: 'nombre_de_bouef',
                                            initialValue: snapshot.data![index].nombre_de_bouef.toString(),
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              icon: Icon(
                                                Icons.zoom_out_map_outlined,
                                                color: Colors.indigo,
                                              ),
                                              hintText: "",
                                              labelText: "Nombre de Bouef",
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(height: 25),
                                          FormBuilderTextField(
                                            name:
                                                'nombre_de_moutons_et_chevres',
                                            initialValue: snapshot.data![index].nombre_de_moutons_et_chevres.toString(),
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              icon: Icon(
                                                  Icons.confirmation_number),
                                              hintText: "",
                                              labelText:
                                                  "Nombre de Moton ET Chevre",
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(height: 25),
                                          FormBuilderTextField(
                                            name: 'nombre_de_chevaux',
                                            initialValue: snapshot.data![index].nombre_de_chevaux.toString(),
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              icon: Icon(
                                                  Icons.confirmation_number),
                                              hintText: "",
                                              labelText: "Nombre de Chevaux",
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(height: 25),
                                          FormBuilderTextField(
                                            name: 'nombre_de_chameaux',
                                            initialValue: snapshot.data![index].nombre_de_chameaux.toString(),
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              icon: Icon(
                                                  Icons.confirmation_number),
                                              hintText: "",
                                              labelText: "Nombre de Chameaux",
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(height: 25),
                                          FormBuilderTextField(
                                            name: 'nombre_de_Ane',
                                            initialValue: snapshot.data![index].nombre_de_Ane.toString(),
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              icon: Icon(
                                                  Icons.confirmation_number),
                                              hintText: "",
                                              labelText: "Nombre de Anes",
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(height: 25),

                                          RaisedButton(
                                            child: Text("Enregistre"),
                                            onPressed: () {
                                              formKey.currentState!.save();
                                              villageInfo villageinfo =
                                                  villageInfo(
                                                      idv: list.id,
                                                      nom_local:
                                                      formKey.currentState!.value['nom_local'],
                                                      distance_par_rapport_au_chef_Lieu_de_la_commune: int.parse(
                                                          formKey.currentState!.value[
                                                          'distance_par_rapport_au_chef_Lieu_de_la_commune']),
                                                      diastance_par_rapport_aux_principaux: int.parse(
                                                          formKey.currentState!.value[
                                                          'diastance_par_rapport_aux_principaux']),
                                                      date_de_creation: formKey
                                                          .currentState!.value['date_de_creation'].toString()
                                                      ,
                                                      population_fixe: int.parse(formKey
                                                          .currentState!.value['population_fixe']),
                                                      nombre_de_menages: int.parse(formKey
                                                          .currentState!.value['nombre_de_menages']),
                                                      // activites_economique: formKey.currentState!
                                                      //     .value['activites_economique'],
                                                      type_de_localite: formKey
                                                          .currentState!.value['type_de_localite'],
                                                      structure_de_habitat: formKey.currentState!
                                                          .value['structure_de_habitat'],
                                                      observation:
                                                      formKey.currentState!.value['observation'],
                                                      nombre_de_familles_estime: int.parse( formKey.currentState!
                                                          .value['nombre_de_familles_estime']),
                                                      population_estimee: int.parse(formKey.currentState!.value['population_estimee']),
                                                      annee_de_estimation:int.parse( formKey.currentState!.value['annee_de_estimation']),
                                                      nombre_de_bouef: int.parse( formKey.currentState!.value['nombre_de_bouef']),
                                                      nombre_de_moutons_et_chevres: int.parse(formKey.currentState!.value['nombre_de_moutons_et_chevres']),
                                                      nombre_de_chevaux: int.parse(formKey.currentState!.value['nombre_de_chevaux']),
                                                      nombre_de_chameaux: int.parse(formKey.currentState!.value['nombre_de_chameaux']),
                                                      nombre_de_Ane: int.parse( formKey.currentState!.value['nombre_de_Ane'])

                                              );
                                              DBvillages.db.updateVillage(villageinfo);

                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Village(),
                                                  settings: RouteSettings(
                                                    arguments: list.idC,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          SizedBox(height: 30),
                                        ],
                                      ),
                                    ),
                                  );
                            });
                      }
                      return Container(
                        alignment: AlignmentDirectional.center,
                        child: new CircularProgressIndicator(),
                      );

                    })));
    }








  }


