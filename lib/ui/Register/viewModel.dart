import 'package:chatting_app/ui/FirebaseErrors.dart';
import 'package:chatting_app/ui/Register/navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier{
  late Connector navigator;
  //now it's ready to use firebase authentication
  // firstly make object from auth to deal with it's function easily
  FirebaseAuth firebaseAuth= FirebaseAuth.instance;
  void register(String email,String password)async{
    try {
      navigator.showLoading();
      var credential =await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      navigator.hideLoading();
      print('successfully creation ${credential.user?.uid}');
    } on FirebaseAuthException catch (e) {
      navigator.showLoading();
      if (e.code ==  FirebaseErrors.weakPassword) {
        navigator.hideLoading();
        navigator.showMessage('The password provided is too weak.');
        print('The password provided is too weak.');
      } else if (e.code == FirebaseErrors.usedEmail) {
        navigator.hideLoading();
        navigator.showMessage('The account already exists for that email.');
        print('The account already exists for that email.');
      }
    } catch (e) {
      navigator.hideLoading();
      navigator.showMessage('SomeThing was wrong');
      print(e);
    }
  }
}