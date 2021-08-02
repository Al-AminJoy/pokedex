import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/PokemonModel.dart';
class PokemonRepository{
  final baseUrl = 'pokeapi.co';
  final client = http.Client();

  Future<Pokemon> getPokemonPage(int index) async {
    final queryParameter = {
      'limit': '200',
      'offset': (index*200).toString()
    };
    final uri = Uri.https(baseUrl, '/api/v2/pokemon',queryParameter);
    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    return Pokemon.fromJson(json);
  }
}