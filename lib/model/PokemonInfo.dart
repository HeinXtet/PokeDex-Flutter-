class PokemonInfo {
  final weight;
  final height;
  final types;

  PokemonInfo({this.height, this.weight, this.types});

  factory PokemonInfo.fromJson(Map<String, dynamic> json) {
    List<dynamic> types = json['types'];
    List<Types> pokemonTypes = types.map((e) => Types.fromJson(e)).toList();
    return PokemonInfo(
      weight: json['weight'],
      height: json['height'],
      types: pokemonTypes,
    );
  }
}

class Types {
  final slot;
  final type;

  Types({this.type, this.slot});

  factory Types.fromJson(Map<String, dynamic> json) {
    return Types(
      type: json['type'],
      slot: json['slot'],
    );
  }
}
