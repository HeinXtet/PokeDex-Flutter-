import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:poke_dex/controller/PokemonController.dart';
import 'package:poke_dex/model/PokemonInfo.dart';
import 'package:http/http.dart' as http;

class PokemonInfoController extends GetxController{
  var loading = false.obs;
  var pokemonInfo = PokemonInfo().obs;
  var isLoading = false.obs;

  static const maxHp = 300;

  static const maxAttack = 300;

  static const maxDefense = 300;

  static const maxSpeed = 300;

  static const maxExp = 1000;

  getHp () =>  Random().nextInt(maxHp);
  getAttack() =>  Random().nextInt(maxAttack);
  getDefense() => Random().nextInt(maxDefense);
  getSpeed() => Random().nextInt(maxSpeed);
  getExp() => Random().nextInt(maxExp);



  fetchPokemonInfo(name) async {
    loading.value = true;
    var response = await http.get("${PokemonListController.BASE_API_URL}/pokemon/$name");
    if (response.statusCode == 200) {
      loading.value = false;
      var pokemonInfoData = PokemonInfo.fromJson(jsonDecode(response.body));
      pokemonInfo.value = pokemonInfoData;
    } else {
      loading.value = false;
      throw Exception('Failed to load album');
    }

    print('Response $response');
  }

  getWeightForKg() {
    return "${pokemonInfo.value.weight / 10} KG";
  }

  getHeightForM() {
    return "${pokemonInfo.value.height / 10} M";
  }
}