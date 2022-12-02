part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object>get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class   LoginPassword extends LoginState {
  final int userId;
  const LoginPassword(this.userId);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginPassword && other.userId == userId;
  }

  @override
  int get hashCode => userId.hashCode;
}

class LoginSuccess extends LoginState {
  final String accessToken;
  final String refreshToken;
  const LoginSuccess(this.accessToken, this.refreshToken);

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

