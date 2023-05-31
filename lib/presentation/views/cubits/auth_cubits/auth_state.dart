import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthStates{}

class AuthInitialState extends AuthStates{}

class AuthLoadingState extends AuthStates{}

class AuthCodeSentState extends AuthStates{}

class AuthCodeVerifiedState extends AuthStates{}

class AuthCodeErrorState extends AuthStates{
  final String error;

  AuthCodeErrorState(this.error);
}

class AuthLoggedInState extends AuthStates{
  final User firebaseUser;

  AuthLoggedInState(this.firebaseUser);

}

class AuthLoggedOutState extends AuthStates{}