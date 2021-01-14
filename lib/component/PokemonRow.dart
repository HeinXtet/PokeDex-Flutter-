import 'package:flutter/material.dart';
import 'package:poke_dex/controller/PokemonController.dart';
import 'package:poke_dex/screen/PokemonDetail.dart';
import 'package:poke_dex/utils/utils.dart';

class PokemonRow extends StatelessWidget {
  PokemonRow({this.pokemon, this.index, this.controller});

  final pokemon;
  final index;
  final PokemonListController controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:getImagePalette(Image.network(
        "${PokemonListController.BASE_IMAGE_URL}${index + 1}.png",
        height: 200,
        width: double.infinity,
      ).image),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        return snapshot.hasData
            ? InkWell(
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
                  color: Color(snapshot.data),
                  child: Container(
                    decoration: BoxDecoration(color: Color(000000)),
                    child: Column(
                      children: [
                        Expanded(
                          child: Hero(
                            tag: index.toString(),
                            child: Image.network(
                              "${PokemonListController.BASE_IMAGE_URL}${index + 1}.png",
                              height: 200,
                              width: double.infinity,
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
              )
            : Container(
                height: 200,
                width: double.infinity,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
      },
    );
  }
}
