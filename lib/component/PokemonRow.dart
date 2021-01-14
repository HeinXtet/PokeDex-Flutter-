import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_dex/controller/PokemonController.dart';
import 'package:poke_dex/screen/PokemonDetail.dart';

class PokemonRow extends StatelessWidget {
  PokemonRow({this.pokemon, this.index});

  final pokemon;
  final index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (BuildContext context) => PokemonDetail(
            index: index,
            pokemon: pokemon,
          ),
        ),
      ),
      child: Card(
        child: Container(
          decoration: BoxDecoration(),
          child: Column(
            children: [
              Expanded(
                child: Hero(
                  tag: index.toString(),
                  child: Image.network(
                    "${PokemonListController.BASE_IMAGE_URL}${index + 1}.png",
                    height: 200,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "${pokemon.name}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
