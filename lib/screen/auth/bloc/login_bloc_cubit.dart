import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../service/api_service.dart';
import 'login_bloc_state.dart';

class LoginBloc extends Cubit<LoginState> {
  ApiService apiService;

  LoginBloc(this.apiService)
      : super(const LoginState(
      loading: false,
      isSuccess: false)){
    userController.text = '2088888';
    passwordController.text = 'ral11lod';
  }

  static final userController = TextEditingController();
  static final passwordController = TextEditingController();


  login() async {
    emit(state.copyWith(loading: true));
    var res = await apiService.loginUser(
        userController.text, passwordController.text);
    if (res == "success") {
      emit(state.copyWith(loading: false));
      emit(state.copyWith(isSuccess: true));
    } else {
      emit(state.copyWith(loading: false));
      emit(state.copyWith(isSuccess: false));
    }
  }

  @override
  Future<void> close() {
    userController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
