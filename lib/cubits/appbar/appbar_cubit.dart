// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

class AppbarCubit extends Cubit<double> {
  AppbarCubit() : super(0);

  void setOffset(double offset) => emit(offset);
}
