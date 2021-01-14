import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

getTypeColor(String type) {
  print("HELO TYPE $type");
  switch (type) {
    case 'fighting':
      return HexColor('9F422A');
      break;
    case 'poison':
      return HexColor('642785');
      break;
    case 'ground':
      return HexColor('AD7235');
      break;
    case 'rock':
      return HexColor('4B190E');
      break;
    case 'bug':
      return HexColor('179A55');
      break;
    case 'ghost':
      return HexColor('363069');
      break;
    case 'steel':
      return HexColor('5C756D');
      break;
    case 'fire':
      return HexColor('B22328');
      break;
    case 'water':
      return HexColor('2648DC');
      break;
    case 'grass':
      return HexColor('007C42');
      break;
    case 'electric':
      return HexColor('E0E64B');
      break;
    case 'psychic':
      return HexColor('AC296B');
      break;
    case 'ice':
      return HexColor('7ECFF2');
      break;
    case 'dragon':
      return HexColor('378A94');
      break;
    case 'fairy':
      return HexColor('9E1A44');
      break;
    case 'dark':
      return HexColor('040706');
      break;
    default :
      return HexColor("000000");
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Future<int> getImagePalette(ImageProvider imageProvider) async {
  final PaletteGenerator paletteGenerator =
      await PaletteGenerator.fromImageProvider(imageProvider);
  return paletteGenerator.dominantColor.color.value;
}
