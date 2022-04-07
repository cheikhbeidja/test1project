// import 'package:elwa6an/afficherEducation.dart';
// import 'package:elwa6an/models/Education.dart';
// import 'package:elwa6an/models/village.dart';
// import 'package:elwa6an/models/willaya.dart';
// import 'package:elwa6an/utils/database.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:intl/intl.dart';

// import 'Home.dart';
// import 'addvillage.dart';
// import 'afficherVillage.dart';
// import 'models/villageInfo.dart';

// class modifierEducation extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return modifiereducation();
//   }
// }

// class modifiereducation extends State<modifierEducation> {
//   final formKey = GlobalKey<FormBuilderState>();

//   @override
//   Widget build(BuildContext context) {
//     education list = ModalRoute.of(context)!.settings.arguments as education;
    

//     return  Scaffold(
//             appBar: AppBar(
//               title: Text('Modifier education '),
//               backgroundColor: Colors.deepPurple,
//             ),
//         body: new Container(
//             padding: new EdgeInsets.all(16.0),
//                 child: new FutureBuilder<List<education>>(
//                     future: DBvillages.db.queryEducation(list.id),
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData) {
//                         return new ListView.builder(
//                             itemCount: 1,
//                             itemBuilder: (context, index) {
//                               return FormBuilder(
//                   key: formKey,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: <Widget>[
//                         FormBuilderTextField(
//                           name: 'nom',
//                           initialValue: snapshot.data![index].nom,
//                           decoration: InputDecoration(
//                             icon: Icon(
//                               Icons.location_city,
//                               color: Colors.green,
//                             ),
//                             hintText: "Enter le nom ",
//                             labelText: "Nom",
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                         SizedBox(height: 25),
//                         FormBuilderTextField(
//                           name:
//                           'type',
//                           initialValue:
//                           snapshot.data![index].type,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                             icon: Icon(
//                               Icons.space_dashboard_outlined,
//                               color: Colors.indigo,
//                             ),
//                             hintText: "",
//                             labelText:
//                             "type Education",
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                         SizedBox(height: 25),

//                         RaisedButton(
//                           child: Text("Enregistre"),
//                           onPressed: () {
//                             formKey.currentState!.save();

//                             education _education = education(
//                                 nom: formKey.currentState!.value['nom'],
//                                 idv: list.idv,
//                                 type: formKey.currentState!.value['type'],
//                             );
//                             DBvillages.db.insertEducation(_education);
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => Education(),
//                                 settings: RouteSettings(
//                                   arguments: idv,
//                                 ),
//                               ),
//                             );

//                           },
//                         ),
//                         SizedBox(height: 30),
//                       ],
//                     ),
//                   ),
//                 );
//                             });
//                       }
                      







//   }


