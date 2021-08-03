import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/data/pokemon_model.dart';
import 'package:pokedex/bloc/pokemon_event.dart';
import 'package:pokedex/bloc/pokemon_state.dart';
import 'package:pokedex/data/pokemon_repository.dart';

class PokemonBloc extends Bloc<PokemonEvent,PokemonState>{
  PokemonBloc() : super(PokemonInitial());

  @override
  Stream<PokemonState> mapEventToState(PokemonEvent event) async* {
    if(event is PokemonPageRequest){
      yield PokemonLoading();
      try{
        final response = await PokemonRepository().getPokemonPage(event.page);
        yield PokemonLoaded(pokemonListing: response.pokemonListing, canLoadNextPage: response.canLoadNextPage);
      }
      catch(e){
        yield PokemonLoadFailed(error: e);
      }
    }
  }
  
  
}