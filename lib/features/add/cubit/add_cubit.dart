import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cantwait28/repositories/items_repository.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit(this._itemsRepository) : super(const AddState());

  final ItemsRepository _itemsRepository;

  Future<void> add(
    String title,
    String imageURL,
    DateTime releaseDate,
  ) async {
    try {
      // throw Exception('Coś poszło nie tak'); //tak można wywołać error, żeby sprawdzić czy prawidłowo się wyświetla, poniższe dane 18-24 zakomentowane
      await _itemsRepository.add(title, imageURL, releaseDate);

      emit(const AddState(saved: true));
    } catch (error) {
      emit(AddState(errorMessage: error.toString()));
    }
  }
}
