import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_dex/screen/PokemonCharacter.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    new Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.pushAndRemoveUntil<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => PokemonCharacter(),
          ),
          (route) => false, //if you want to disable back feature set to false
        );
      },
    );

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(color: Colors.red),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('images/pokeball.png'),
              height: 100,
              width: 100,
            ),
            Text(
              "Poke Dex",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
