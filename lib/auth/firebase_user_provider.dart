import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ParityFirebaseUser {
  ParityFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

ParityFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ParityFirebaseUser> parityFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<ParityFirebaseUser>((user) => currentUser = ParityFirebaseUser(user));
