//view Model ..>Provider

import 'package:chatting_app/database/database-utils.dart';
import 'package:chatting_app/ui/FirebaseErrors.dart';
import 'package:chatting_app/ui/Login/navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogInViewModel extends ChangeNotifier{
  late Connector connector;
  FirebaseAuth firebaseAuth =FirebaseAuth.instance;
  void logIn(String email,String password)async{
   try{
     print('helloooo from login');
     connector.showLoading();
     var credential=await firebaseAuth.signInWithEmailAndPassword(
         email: email,
         password: password
     );
     //read user from database
    var result=await DatabaseUtils().getUser(credential.user?.uid??'');
    if(result==null){
      print('something was wrong');
    }else{
      connector.goToHome();
    }
    // print('successfully log in');
     connector.hideLoading();
   }on FirebaseAuthException catch (e) {
     if (e.code == FirebaseErrors.noUser) {
       connector.showmessage('No user found for that email.');
       print('No user found for that email.');
     } else if (e.code == FirebaseErrors.wrongPassword) {
       print('Wrong password provided for that user.');
     }
   }
  }
}