import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth{
  Future<String> signin(String email, String password);
  Future<String> SignUp(String email, String password);
  Future<void> SignOut();
  Future<FirebaseUser> getCurrentUser();
}
class Auth implements BaseAuth{
  final FirebaseAuth _firebaseauth=FirebaseAuth.instance;

  @override
  Future<String> signin(String email, String password) async{
    final AuthResult=await _firebaseauth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser mUser=AuthResult.user;
    return mUser.uid;
  }
  @override
  Future<String> SignUp(String email, String password) async{
    final AuthResult=await _firebaseauth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser mUser=AuthResult.user;
    return mUser.uid;
  }
  @override
  Future<void> SignOut() async{
    _firebaseauth.signOut();
  }
  Future<void> ForgotPassword(String email) async{
    await _firebaseauth.sendPasswordResetEmail(email: email);
  }
  @override
  Future<FirebaseUser> getCurrentUser() async{
    FirebaseUser mUser=await _firebaseauth.currentUser();
    return mUser;
  }
}