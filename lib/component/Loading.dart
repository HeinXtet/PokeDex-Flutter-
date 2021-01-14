import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_dex/controller/PokemonController.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PokemonListController controller = Get.find();
    return Obx(
      () => controller.loading.value
          ? Container(
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                  backgroundColor: Colors.red,
                ),
              ),
            )
          : Container(),
    );
  }
}
