import 'package:flutter/cupertino.dart';
import 'package:pokedex/data/pokemon_model.dart';

abstract class PokemonState{}
class PokemonInitial extends PokemonState{}
class PokemonLoading extends PokemonState{}
class PokemonLoaded extends PokemonState{
  final List<PokemonListing> pokemonListing;
  final bool canLoadNextPage;

  PokemonLoaded({@required this.pokemonListing,@required this.canLoadNextPage});

}

class PokemonLoadFailed extends PokemonState{
  final Error error;
  PokemonLoadFailed({@required this.error});
}
