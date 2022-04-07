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

class AddVillage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddVillages();
  }
}

class AddVillages extends State<AddVillage> {
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    village list = ModalRoute.of(context)!.settings.arguments as village;
    String name = list.nom_administratif;




        return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('information sur $name'),
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
                          name: 'nom_local',
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
                          // initialValue:
                          // list.distance_par_rapport_au_chef_Lieu_de_la_commune,
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
                          name: 'diastance_par_rapport_aux_principaux',
                          //initialValue: list.diastance_par_rapport_aux_principaux,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.social_distance,
                              color: Colors.indigo,
                            ),
                            hintText: "",
                            labelText: "Distance par rapport au axe principaux",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 25),
                        FormBuilderDateTimePicker(
                          name: "date_de_creation",
                          //initialValue: list.date_de_creation,
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
                          //initialValue: list.population_fixe,
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
                          // initialValue: list.nombre_de_menages,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            icon: Icon(Icons.confirmation_number),
                            hintText: "",
                            labelText: "Nomre de ménages",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 25),

                        FormBuilderRadioGroup(
                          name: "type_de_localite",
                          //initialValue: list.type_de_localite,
                          decoration: InputDecoration(
                              labelText: "Type de localité ",
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22)),
                          options: [
                            FormBuilderFieldOption(value: "pastoral"),
                            FormBuilderFieldOption(
                                value: "permanent non adminisratif"),
                            FormBuilderFieldOption(value: "adminisratif"),
                            FormBuilderFieldOption(value: "saisonnier"),
                          ],
                        ),
                        SizedBox(height: 25),
                        FormBuilderRadioGroup(
                          name: "structure_de_habitat",
                          //initialValue: list.structure_de_habitat,
                          decoration: InputDecoration(
                              labelText: "Structure de l'habitat",
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22)),
                          options: [
                            FormBuilderFieldOption(value: "dispersé"),
                            FormBuilderFieldOption(value: "regroupé"),
                            FormBuilderFieldOption(value: "urbain"),
                            FormBuilderFieldOption(value: "nomade"),
                          ],
                        ),
                        SizedBox(height: 40),
                        FormBuilderTextField(
                          name: 'observation',
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: Colors.indigo,
                            ),
                            hintText: "Observation sur l'accés à la localité",
                            labelText: "Observation",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 25),
                        FormBuilderTextField(
                          name: 'nombre_de_familles_estime',
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
                          name: 'nombre_de_moutons_et_chevres',
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            icon: Icon(Icons.confirmation_number),
                            hintText: "",
                            labelText: "Nombre de Moton ET Chevre",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 25),
                        FormBuilderTextField(
                          name: 'nombre_de_chevaux',
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            icon: Icon(Icons.confirmation_number),
                            hintText: "",
                            labelText: "Nombre de Chevaux",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 25),
                        FormBuilderTextField(
                          name: 'nombre_de_chameaux',
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            icon: Icon(Icons.confirmation_number),
                            hintText: "",
                            labelText: "Nombre de Chameaux",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 25),
                        FormBuilderTextField(
                          name: 'nombre_de_Ane',
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            icon: Icon(Icons.confirmation_number),
                            hintText: "",
                            labelText: "Nombre de Anes",
                            border: OutlineInputBorder(),
                          ),
                        ),

                        RaisedButton(
                          child: Text("Enregistre"),
                          onPressed: () {
                            formKey.currentState!.save();

                            villageInfo villageinfo = villageInfo(
                                idv: list.id,
                                nom_local:
                                    formKey.currentState!.value['nom_local'],
                                distance_par_rapport_au_chef_Lieu_de_la_commune: int.parse(
                                    formKey.currentState!.value[
                                        'distance_par_rapport_au_chef_Lieu_de_la_commune']),
                                diastance_par_rapport_aux_principaux: int.parse(
                                    formKey.currentState!.value[
                                        'diastance_par_rapport_aux_principaux']),
                                date_de_creation:  formKey
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
                                nombre_de_Ane: int.parse( formKey.currentState!.value['nombre_de_Ane']));

                            DBvillages.db.insertVillage(villageinfo);
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
                ))));
  }
}
