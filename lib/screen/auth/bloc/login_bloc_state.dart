import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool loading;
  final bool isSuccess;

  const LoginState({
    required this.loading,
    required this.isSuccess
  });

  LoginState copyWith({
    bool? loading,
    bool? isValidated,
    bool? isActive,
    bool? isSuccess,
  })
  {
    return LoginState(
        loading: loading?? this.loading,
        isSuccess: isSuccess?? this.isSuccess
    );
  }
  @override
  List<Object> get props => [
    loading,
    isSuccess
  ];
}