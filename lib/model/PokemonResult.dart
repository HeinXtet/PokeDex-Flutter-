class PokemonResult {
  final int count;
  final List<Pokemon> results;

  PokemonResult({this.count,this.results});

  factory PokemonResult.fromJson(Map<String, dynamic> json) {
    List<dynamic> results = json['results'];
    List< Pokemon> pokemons = results.map((e) => Pokemon.fromJson(e)).toList();
    return PokemonResult(
      count: json['count'],
      results : pokemons
    );
  }
}


class Pokemon {
  final name;
  final url;

  Pokemon({this.name, this.url});
  factory Pokemon.fromJson(Map<String, dynamic> json) {

    return Pokemon(
      name: json['name'],
      url: json['url'],
    );
  }
}