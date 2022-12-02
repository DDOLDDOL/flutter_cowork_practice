import 'package:bloc/bloc.dart';
import 'package:flutter_cowork_practice/login/repository/login_repository.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;

  LoginCubit(this._loginRepository) : super(LoginInitial());

  Future<void> verifyPassword(String id, String password) async {
    if (id == '') {
      emit(const LoginError('아이디 입력바랍니다'));
      return;
    }

    if (password == '') {
      emit(const LoginError('비밀번호 입력바랍니다'));
      return;
    }

    emit(LoginLoading());

    Future<bool> login(String id, String password) async {
      emit(LoginLoading());

      try {
        response = await _loginRepository.login(id, password);
        if (!(response.success ?? false)) throw Exception();

        emit(LoginSuccess(response.token!, response.refreshToken!));
        return true;
      } on OperationException catch (error) {
        emit(LoginError(error.toString()));
      }
      return false;
    }
  }
}
