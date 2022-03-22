import 'package:einstein/data/authentication/repos/account_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final AccountDatabase db = AccountDatabase();

  void _setListener(){
    db.auth.authStateChanges().listen((User? user) {
      //TODO: change app state on this callback
      if (user == null) {
        print("there is no user");
      } else {
        print("there is a user");
      }
    });
  }

  Future<bool> signIn(String login, String password) async {
    _setListener();
    final userCred = await db.signInWithPassword(login, password);
    return userCred != null;
  }

  Future<bool> signUp(String login, String password) async {
    _setListener();
    final userCred = await db.signUpWithPassword(login, password);
    return userCred != null;
  }

  Future<bool> signInWithTwitter() async {
    _setListener();
    final userCred = await db.signINWithTwitter();
    return userCred != null;
  }
}
