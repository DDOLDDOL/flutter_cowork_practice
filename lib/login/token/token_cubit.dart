import 'package:bloc/bloc.dart';
import 'package:flutter_cowork_practice/login/token/token_state.dart';

class TokenCubit extends Cubit<TokenState>{
  TokenCubit() : super(TokenState(null, null));

  void setAccessToken(String? token) => emit(TokenState(state.accessToken, token));



  void setRefreshToken(String? token) =>
      emit(TokenState(token, state.refreshToken));


  void setTokens(String accesstoken, String refreshToken) => emit(TokenState(state.accessToken, state.refreshToken));
}