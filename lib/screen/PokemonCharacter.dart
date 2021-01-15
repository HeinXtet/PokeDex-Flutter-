import 'package:flutter/material.dart';
import 'package:poke_dex/component/Loading.dart';
import 'package:poke_dex/component/PokemonGridView.dart';

class PokemonCharacter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Poke Dex"),
        ),
        body: Stack(
          children: [
            PokemonGridView(),
            Loading(),
          ],
        ));
  }
}
