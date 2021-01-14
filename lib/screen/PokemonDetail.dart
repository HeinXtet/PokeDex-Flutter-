import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:poke_dex/component/Loading.dart';
import 'package:poke_dex/component/StatusRow.dart';
import 'package:poke_dex/controller/PokemonController.dart';
import 'package:poke_dex/controller/PokemonInfoController.dart';
import 'package:poke_dex/utils/utils.dart';

class PokemonDetail extends StatefulWidget {
  final index;
  final pokemon;

  PokemonDetail({this.index, this.pokemon});

  @override
  State<StatefulWidget> createState() =>
      DetailState(index: index, pokemon: pokemon);
}

class DetailState extends State<PokemonDetail> {
  DetailState({this.index, this.pokemon});

  final index;
  final pokemon;
  PokemonInfoController controller = Get.put(PokemonInfoController());

  int color = Colors.black.value;

  @override
  void initState() {
    getImagePalette(Image.network(
                "${PokemonListController.BASE_IMAGE_URL}${index + 1}.png")
            .image)
        .then(
      (value) => setState(() {
        color = value;
      }),
    );
    controller.fetchPokemonInfo(pokemon.name);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        backgroundColor: Color(color),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Stack(
            children: [
              Container(
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
                    ),
                    Obx(
                      () => controller.pokemonInfo != null &&
                              !controller.loading.value
                          ? Container(
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text(
                                          controller
                                              .getWeightForKg()
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text(
                                          controller.getHeightForM().toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    child: Text(
                                      'Base Stats',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(color),
                                      ),
                                    ),
                                  ),
                                  controller.pokemonInfo.value.types.length > 0
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ...(controller
                                                    .pokemonInfo.value.types)
                                                .map((type) {
                                              return Container(
                                                margin: EdgeInsets.all(20),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 16,
                                                    horizontal: 50),
                                                decoration: BoxDecoration(
                                                    color: getTypeColor(
                                                        type.type['name']),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8))),
                                                child: Text(
                                                  type.type['name'],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              );
                                            }).toList(),
                                          ],
                                        )
                                      : Container(),
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 20),
                                      child: Column(
                                        children: [
                                          StatusRow(
                                            name: "HP  ",
                                            value: controller.getHp(),
                                            color: HexColor('D53A47'),
                                          ),
                                          StatusRow(
                                            name: "ATK",
                                            value: controller.getAttack(),
                                            color: HexColor("FFA726"),

                                          ),
                                          StatusRow(
                                            name: "DEF",
                                            value: controller.getDefense(),
                                            color: HexColor("0091EA"),
                                          ),
                                          StatusRow(
                                            name: "SPD",
                                            value: controller.getSpeed(),
                                            color: HexColor("57A8D8"),
                                          ),
                                          StatusRow(
                                            name: "EXP",
                                            value: controller.getExp(),
                                            color: HexColor("388E3C"),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
              Loading(),
            ],
          )
        ],
      ),
    );
  }
}
