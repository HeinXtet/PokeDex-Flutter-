import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_dex/controller/PokemonController.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PokemonListController controller = Get.find();
    return Obx(
      () => controller.loading.value
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                backgroundColor: Colors.red,
              ),
            )
          : Container(),
    );
  }
}
