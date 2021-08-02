import 'package:flutter/cupertino.dart';

class PokemonListing{
  final int id;
  final String name;
  PokemonListing({@required this.id,@required this.name});

  String get imageURL =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

  factory PokemonListing.fromJson(Map<String,dynamic> json){
    final name = json['name'];
    final url = json['url'] as String;
    final id = int.parse(url.split('/')[6]);
    return PokemonListing(id: id, name: name);
  }
}

class Pokemon {
  final List<PokemonListing> pokemonListing;
  final bool canLoadNextPage;
  Pokemon({@required this.pokemonListing,@required this.canLoadNextPage});

  factory Pokemon.fromJson(Map<String,dynamic> json){
    final canLoadNextPage = json['next'] !=null;
    final pokemonListing = (json['results'] as List).map((e) => PokemonListing.fromJson(e)).toList();

    return Pokemon(pokemonListing: pokemonListing, canLoadNextPage: canLoadNextPage);
  }
}