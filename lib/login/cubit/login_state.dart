part of 'login_cubit.dart';

abstract class LoginState {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoaded extends LoginState {
  // final String userId;
  // const LoginLoaded(this.userId);
  //
  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;
  //
  //   return other is LoginLoaded && other.userId == userId;
  // }
  // @override
  // int get hashCode => userId.hashCode;
}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String userId;
  final String accessToken;
  final String refreshToken;
  const LoginSuccess(this.userId,this.accessToken, this.refreshToken);


  @override
  int get hashCode => accessToken.hashCode ^ refreshToken.hashCode;
}

class LoginError extends LoginState {
  final String message;
  const LoginError(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

