import 'package:flutter/material.dart';
import 'package:poke_dex/controller/PokemonController.dart';

class PokemonDetail extends StatelessWidget {
  final index;
  final pokemon;

  PokemonDetail({this.index, this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(pokemon.name),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: index.toString(),
                child: Image.network(
                  "${PokemonListController.BASE_IMAGE_URL}${index + 1}.png",
                  height: 300,
                  width: 300,
                ),
              ),
              Text(
                pokemon.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
