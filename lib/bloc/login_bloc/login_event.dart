part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class SendData extends LoginEvent {
  final String email;
  final String password;
  final String domainname;

  SendData({required this.email,required this.password,required this.domainname});
}