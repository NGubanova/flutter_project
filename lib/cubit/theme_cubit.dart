import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  Brightness themes = Brightness.light;
  Icon icon = const Icon(Icons.brightness_2);
  String th = 'light';

  void ThemeClick() {
    emit(OnThemeClick());

    if (themes == Brightness.light) {
      themes = Brightness.dark;
      icon = Icon(Icons.brightness_5);
      th = 'dark';
      emit(OnThemeClick());
    } else {
      themes = Brightness.light;
      icon = Icon(Icons.brightness_2);
      th = 'light';
      emit(OnThemeClick());
    }
  }
}
