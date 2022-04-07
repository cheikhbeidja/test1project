class maughataa {
  int id;
  String nom;
  String idw;

  maughataa({
    required this.id,
    required this.nom,
    required this.idw,
  });
  Map<String, dynamic> toMap() => {
        "id": id,
        "nom": nom,
        "idw": idw,
      };

  factory maughataa.fromMap(Map<String, dynamic> map) => new maughataa(
        id: map["id"],
        nom: map["nom"],
        idw: map["idw"],
      );
}
