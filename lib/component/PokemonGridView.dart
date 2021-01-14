import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_dex/component/PokemonRow.dart';
import 'package:poke_dex/controller/PokemonController.dart';

class PokemonGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController;
    PokemonListController controller = Get.find();
    var data = controller.pokemonList;
    var orientation = MediaQuery.of(context).orientation;
    _scrollListener() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        controller.loadMore();
      }
    }

    _scrollController = new ScrollController(initialScrollOffset: 5.0)
      ..addListener(_scrollListener);
    return Obx(
      () => GridView.builder(
        controller: _scrollController,
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
        itemBuilder: (BuildContext context, int index) {
          var pokemon = data[index];
          return PokemonRow(
            pokemon: pokemon,
            index: index,
            controller: controller,
          );
        },
      ),
    );
  }
}
