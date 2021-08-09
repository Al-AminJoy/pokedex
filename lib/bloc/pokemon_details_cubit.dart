import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/data/pokemon_details.dart';
import 'package:pokedex/data/pokemon_info.dart';
import 'package:pokedex/data/pokemon_repository.dart';
import 'package:pokedex/data/pokemon_species.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetails>{
  final pokemonRepository = PokemonRepository();
  PokemonDetailsCubit() : super(null);

  void getPokemonDetails(int pokemonId)async{
    final response = await Future.wait([
      pokemonRepository.getPokemonInfo(pokemonId),
      pokemonRepository.getPokemonSpeciesInfo(pokemonId)
    ]
        );
    final pokemonInfo = response[0] as PokemonInfo;
    final pokemonSpecies = response[1] as PokemonSpecies;
    
    emit(PokemonDetails(id: pokemonInfo.id,
        name: pokemonInfo.name,
        imageUrl: pokemonInfo.imageUrl,
        height: pokemonInfo.height,
        weight: pokemonInfo.weight,
        types: pokemonInfo.types,
        description: pokemonSpecies.description));
  }

  void clearPokemonDetails (){
    emit(null);
  }
}