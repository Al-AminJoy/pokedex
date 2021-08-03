import 'package:flutter_bloc/flutter_bloc.dart';

class NavCubit extends Cubit<int>{
  NavCubit() : super(null);

  void showPokemonDetails (int index) => emit(index);

  void popToPokedex ()=> emit(null);

}