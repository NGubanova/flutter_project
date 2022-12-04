import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'list_state.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit() : super(ListInitial());

  int counts = 0;
  List<String> elements = <String>[];

  void ClickAdd(int count, Brightness currTheme){

    if(currTheme == Brightness.light){
      elements.add("Циферка: $count Испепеление глаз");
    } else {
      elements.add("Циферка: $count Темнота друг молодежи, в темноте не видно рожи".replaceAll("Entry", ""));
    }
    
    counts++;

    emit(OnClickAdd());
  }
}
