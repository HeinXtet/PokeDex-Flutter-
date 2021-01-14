import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:poke_dex/model/PokemonResult.dart';

class PokemonListController extends GetxController {
  var pokemonList = [].obs;
  static const BASE_API_URL = "https://pokeapi.co/api/v2/";
  static const BASE_IMAGE_URL =
      "https://pokeres.bastionbot.org/images/pokemon/";
  var isLoading = false.obs;
  static const LIMIT = 20;
  var page = 0;
  var loading = false.obs;

  PokemonListController() {
    fetchPokemon();
  }

  loadMore() {
    if (loading.value) {
      return;
    }
    page++;
    fetchPokemon();
  }

  fetchPokemon() async {
    var offset = page * LIMIT;
    loading.value = true;
    var response =
        await http.get("$BASE_API_URL/pokemon?offset=$offset&&limit=20");
    if (response.statusCode == 200) {
      loading.value = false;
      var pokemonData = PokemonResult.fromJson(jsonDecode(response.body));
      pokemonList.addAll(pokemonData.results);
    } else {
      loading.value = false;
      throw Exception('Failed to load album');
    }
  }
}
