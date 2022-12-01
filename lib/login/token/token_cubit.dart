import 'package:bloc/bloc.dart';
import '../cubit/token_state.dart';

class TokenCubit extends Cubit<TokenState>{
  TokenCubit() : super(TokenState(null, null));

  void setAccessToken(String? token) => emit(TokenState(state.accessToken, token));
  // state.accessToken = token;


  void setRefreshToken(String? token) =>
      emit(TokenState(token, state.refreshToken));
// state.refreshToken = token;

}