class DragonBallCharacter {
  final int id;
  final String name;
  final String ki;
  final String maxKi;
  final String race;
  final String gender;
  late final String description;
  final String image;
  final String affiliation;
  final String? deletedAt;
  final OriginPlanet originPlanet;
  final List<dynamic> transformations;

  DragonBallCharacter({
    required this.id,
    required this.name,
    required this.ki,
    required this.maxKi,
    required this.race,
    required this.gender,
    required this.description,
    required this.image,
    required this.affiliation,
    required this.deletedAt,
    required this.originPlanet,
    required this.transformations,
  });

  factory DragonBallCharacter.fromJson(Map<String, dynamic> json) {
    return DragonBallCharacter(
      id: json['id'],
      name: json['name'],
      ki: json['ki'],
      maxKi: json['maxKi'],
      race: json['race'],
      gender: json['gender'],
      description: json['description'],
      image: json['image'],
      affiliation: json['affiliation'],
      deletedAt: json['deletedAt'],
      originPlanet: OriginPlanet.fromJson(json['originPlanet']),
      transformations: json['transformations'],
    );
  }
}

class OriginPlanet {
  final int id;
  final String name;
  final bool isDestroyed;
  final String description;
  final String image;
  final String? deletedAt;

  OriginPlanet({
    required this.id,
    required this.name,
    required this.isDestroyed,
    required this.description,
    required this.image,
    required this.deletedAt,
  });

  factory OriginPlanet.fromJson(Map<String, dynamic> json) {
    return OriginPlanet(
      id: json['id'],
      name: json['name'],
      isDestroyed: json['isDestroyed'],
      description: json['description'],
      image: json['image'],
      deletedAt: json['deletedAt'],
    );
  }
}
