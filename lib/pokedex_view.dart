import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/bloc/pokemon_bloc.dart';

import 'bloc/pokemon_state.dart';
class PokedexView extends StatefulWidget {
  const PokedexView({Key key}) : super(key: key);

  @override
  _PokedexViewState createState() => _PokedexViewState();
}

class _PokedexViewState extends State<PokedexView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PokeDex'),
      ),
      body: BlocBuilder<PokemonBloc,PokemonState>(
        builder: (context, state) {
          if(state is PokemonLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(state is PokemonLoaded){
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemCount: state.pokemonListing.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: GridTile(
                      child: Column(
                        children: [
                          Image.network(state.pokemonListing[index].imageURL),
                          Text(state.pokemonListing[index].name),
                        ],
                      ),
                    )
                  );
                },);
          }
          else if(state is PokemonLoadFailed){
            return Center(
              child: Text('${state.error}'),
            );
          }
          else{
            return Container();
          }
        },
      ),
    );
  }
}
