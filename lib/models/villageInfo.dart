class villageInfo {
  int idv;
  String nom_local;
  int distance_par_rapport_au_chef_Lieu_de_la_commune;
  int diastance_par_rapport_aux_principaux;
  String date_de_creation;
  int population_fixe;
  int nombre_de_menages;
  //String activites_economique;
  String type_de_localite;
  String structure_de_habitat;
  String observation;
  int nombre_de_familles_estime;
  int population_estimee;
  int annee_de_estimation;
  int nombre_de_bouef;
  int nombre_de_moutons_et_chevres;
  int nombre_de_chevaux;
  int nombre_de_chameaux;
  int nombre_de_Ane;

  villageInfo({
    required this.idv,
    required this.nom_local,
    required this.distance_par_rapport_au_chef_Lieu_de_la_commune,
    required this.diastance_par_rapport_aux_principaux,
    required this.date_de_creation,
    required this.population_fixe,
    required this.nombre_de_menages,
    //required this.activites_economique,
    required this.type_de_localite,
    required this.structure_de_habitat,
    required this.observation,
    required this.nombre_de_familles_estime,
    required this.population_estimee,
    required this.annee_de_estimation,
    required this.nombre_de_bouef,
    required this.nombre_de_moutons_et_chevres,
    required this.nombre_de_chevaux,
    required this.nombre_de_chameaux,
    required this.nombre_de_Ane,
  });
  Map<String, dynamic> toMap() => {
        "idv": idv,
        "nom_local": nom_local,
        "distance_par_rapport_au_chef_Lieu_de_la_commune":
            distance_par_rapport_au_chef_Lieu_de_la_commune,
        "diastance_par_rapport_aux_principaux":
            diastance_par_rapport_aux_principaux,
        "date_de_creation": date_de_creation,
        "population_fixe": population_fixe,
        "nombre_de_menages": nombre_de_menages,
        //"activites_economique": activites_economique,
        "type_de_localite": type_de_localite,
        "structure_de_habitat": structure_de_habitat,
        "observation": observation,
        "nombre_de_familles_estime": nombre_de_familles_estime,
        "population_estimee": population_estimee,
        "annee_de_estimation": annee_de_estimation,
        "nombre_de_bouef": nombre_de_bouef,
        "nombre_de_moutons_et_chevres": nombre_de_moutons_et_chevres,
        "nombre_de_chevaux": nombre_de_chevaux,
        "nombre_de_chameaux": nombre_de_chameaux,
        "nombre_de_Ane": nombre_de_Ane,
      };

  factory villageInfo.fromMap(Map<String, dynamic> map) => new villageInfo(
        idv: map["idv"],
        nom_local: map["nom_local"],
        distance_par_rapport_au_chef_Lieu_de_la_commune:
            map["distance_par_rapport_au_chef_Lieu_de_la_commune"],
        diastance_par_rapport_aux_principaux:
            map["diastance_par_rapport_aux_principaux"],
        date_de_creation: map["date_de_creation"],
        population_fixe: map["population_fixe"],
        nombre_de_menages: map["nombre_de_menages"],
        //activites_economique: map["activites_economique"],
        type_de_localite: map["type_de_localite"],
        structure_de_habitat: map["structure_de_habitat"],
        observation: map["observation"],
        nombre_de_familles_estime: map["nombre_de_familles_estime"],
        population_estimee: map["population_estimee"],
        annee_de_estimation: map["annee_de_estimation"],
        nombre_de_bouef: map["nombre_de_bouef"],
        nombre_de_moutons_et_chevres: map["nombre_de_moutons_et_chevres"],
        nombre_de_chevaux: map["nombre_de_chevaux"],
        nombre_de_chameaux: map["nombre_de_chameaux"],
        nombre_de_Ane: map["nombre_de_Ane"],
      );
}
