import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/data/pokemon_info.dart';
import 'package:pokedex/data/pokemon_model.dart';
import 'package:pokedex/data/pokemon_species.dart';
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

  Future<PokemonInfo> getPokemonInfo(int id) async{
    final uri=Uri.https(baseUrl, '/api/v2/pokemon/$id');
    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      print(json);
      return PokemonInfo.fromJson(json);
    }
    catch(e){
      print(e);
    }
  }

  Future<PokemonSpecies> getPokemonSpeciesInfo(int id) async{
    final uri=Uri.https(baseUrl, '/api/v2/pokemon-species/$id');
    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      print(json);
      return PokemonSpecies.fromJson(json);
    }
    catch(e){
      print(e);
    }
  }
}