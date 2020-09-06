import 'package:firebase_auth/firebase_auth.dart';
import 'package:max_fit/domain/user.dart';

class AuthService {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _fAuth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return User.fromFirebase(user);
    } catch(e) {

    }
  }

  Future<User> registerWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _fAuth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return User.fromFirebase(user);
    } catch(e) {

    }
  }
  
  Future logOut() async {
    await _fAuth.signOut();
  }
  
  Stream<User> get currentUser{
    return _fAuth.onAuthStateChanged.map((FirebaseUser user) => user != null ? User.fromFirebase(user) : null);
  }
}