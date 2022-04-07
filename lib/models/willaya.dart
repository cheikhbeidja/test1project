class willaya {
  String id;
  String nom;

  willaya({
    required this.id,
    required this.nom,
  });
  Map<String, dynamic> toMap() => {
        "id": id,
        "nom": nom,
      };

  factory willaya.fromMap(Map<String, dynamic> map) => new willaya(
        id: map["id"],
        nom: map["nom"],
      );
}
