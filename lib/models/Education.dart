class education {
  int idv;
  String nom;
  String type;

  education({
    required this.idv,
    required this.nom,
    required this.type,
  });
  Map<String, dynamic> toMap() => {
        "idv": idv,
        "nom": nom,
        "type": type,
      };

  factory education.fromMap(Map<String, dynamic> map) => new education(
        idv: map["idv"],
        nom: map["nom"],
        type: map["type"],
      );
}
