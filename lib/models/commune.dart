class commune {
  int id;
  String nom;
  int idM;

  commune({
    required this.id,
    required this.nom,
    required this.idM,
  });
  Map<String, dynamic> toMap() => {
        "id": id,
        "nom": nom,
        "idM": idM,
      };

  factory commune.fromMap(Map<String, dynamic> map) => new commune(
        id: map["id"],
        nom: map["nom"],
        idM: map["idM"],
      );
}
