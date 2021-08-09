import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon_details_cubit.dart';

class NavCubit extends Cubit<int>{
  PokemonDetailsCubit pokemonDetailsCubit;
  NavCubit({this.pokemonDetailsCubit}) : super(null);

  void showPokemonDetails (int index) {
    pokemonDetailsCubit.getPokemonDetails(index);
    emit(index);

  }

  void popToPokdex (){
    emit(null);
    pokemonDetailsCubit.clearPokemonDetails();
  }

}