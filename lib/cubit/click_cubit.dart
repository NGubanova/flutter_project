import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'click_state.dart';

class ClickCubit extends Cubit<ClickState> {
  ClickCubit() : super(ClickInitial());

  int count = 0;

  void ClickAddLight() {
    count++;
    emit(OnClick());
  }

  void ClickAddDark() {
    count += 2;
    emit(OnClick());
  }
  void ClickRemoveLight() {
    count--;
    emit(OnClick());
  }

  void ClickRemoveDark() {
    count -= 2;
    emit(OnClick());
  }
}
