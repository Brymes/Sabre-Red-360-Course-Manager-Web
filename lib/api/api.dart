import 'package:webapp/index.dart';

abstract class Api {
  Future<void> logIn({String email, String password});
  Future<void> signUp({String email, String password, String firstName, String lastName});

  Future<void> getStudents();
}
