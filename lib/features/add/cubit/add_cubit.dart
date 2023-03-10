import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(const AddState());

  Future<void> add(
    String title,
    String imageURL,
    DateTime releaseDate,
  ) async {
    try {
      // throw Exception('Coś poszło nie tak'); //tak można wywołać error, żeby sprawdzić czy prawidłowo się wyświetla, poniższe dane 18-24 zakomentowane
      await FirebaseFirestore.instance.collection('items').add(
        {
          'title': title,
          'image_url': imageURL,
          'release_date': releaseDate,
        },
      );
      emit(const AddState(saved: true));
    } catch (error) {
      emit(AddState(errorMessage: error.toString()));
    }
  }
}
