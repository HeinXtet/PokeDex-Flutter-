import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_dex/controller/PokemonController.dart';
import 'package:poke_dex/screen/PokemonCharacter.dart';

void main() => runApp(PokeDexApp());

class PokeDexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     Get.put(PokemonListController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Poke Dex"),
          backgroundColor: Colors.red,
        ),
        body: PokemonCharacter(),
      ),
    );
  }
}
