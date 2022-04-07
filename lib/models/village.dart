class village {
  int id;
  int idC;
  String nom_administratif;


  village({
    required this.id,
    required this.idC,
    required this.nom_administratif,

  });
  Map<String, dynamic> toMap() => {
        "id": id,
        "idC": idC,
        "nom_administratif": nom_administratif,

      };

  factory village.fromMap(Map<String, dynamic> map) => new village(
        id: map["id"],
        idC: map["idC"],
        nom_administratif: map["nom_administratif"],

      );
}
