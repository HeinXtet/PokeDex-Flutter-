import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_dex/controller/PokemonController.dart';
import 'package:poke_dex/screen/Splash.dart';
import 'package:poke_dex/transaction/Messages.dart';

void main() => runApp(PokeDexApp());

class PokeDexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(PokemonListController());
    return GetMaterialApp(
      translations: Messages(),
      locale: Locale('en', 'EN'),
      fallbackLocale: Locale('en', 'UK'),
      debugShowCheckedModeBanner: false,
      home:  Splash(),
    );
  }
}
