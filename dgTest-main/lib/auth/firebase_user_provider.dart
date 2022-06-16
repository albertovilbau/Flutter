import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class DGTestFirebaseUser {
  DGTestFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

DGTestFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<DGTestFirebaseUser> dGTestFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<DGTestFirebaseUser>((user) => currentUser = DGTestFirebaseUser(user));
