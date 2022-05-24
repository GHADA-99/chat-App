import 'dart:ui';

import 'package:chatting_app/Home/homeScreen.dart';
import 'package:chatting_app/ui/FirebaseErrors.dart';
import 'package:chatting_app/ui/Login/navigator.dart';
import 'package:chatting_app/ui/Login/viewModel.dart';
import 'package:chatting_app/ui/Register/registerScreen.dart';
import 'package:chatting_app/ui/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  static const routeName = 'Log in';

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> implements Connector{
  String email = '';

  String password = '';
  String message = '';

  GlobalKey<FormState> formKey=GlobalKey<FormState>();

  LogInViewModel viewModel=LogInViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.connector=this;
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext)=>viewModel,
      child: Stack(
        children: [
          PatternBack(),
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text('Login'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:const [
                        Text('Welcome Back!',style: TextStyle(color: Colors.black,fontSize: 24)),
                      ],
                    ),
                    TextFormField(
                      onChanged: (text){
                        email=text;
                      },
                      validator: (text){
                        if(text==null||text.trim().isEmpty){
                          return InfoErrors.emailError;
                        }
                        return null;
                      },
                      decoration:const  InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle()
                      ),
                    ),

                    TextFormField(
                      onChanged: (text){
                        password=text;
                      },
                      validator: (text){
                        if(text==null||text.trim().isEmpty){
                          return InfoErrors.passwordError;
                        }
                      },
                      decoration:const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle()
                      ),
                    ),
                    SizedBox(height: 24),
                     InkWell(
                       onTap: (){},
                       child:Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           const Text('Forget Password?'),
                         ],
                       ),
                     ),
                    SizedBox(height: 24),
                     ElevatedButton(
                       onPressed: (){
                         formValidator();
                       },
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                         children: const [
                           Padding(
                             padding: EdgeInsets.all(16),
                             child: Text(
                               'Log in',
                               style: TextStyle(fontSize: 18),
                             ),
                           ),
                           Icon(Icons.navigate_next),
                         ],
                       ),),
                    SizedBox(height: 24,),
                     InkWell(
                       onTap: (){
                         Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
                       },
                       child:Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           const Text('Create my Account'),
                         ],
                       ),
                     ),

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void formValidator(){
    if(formKey.currentState?.validate()==true){
      //Log in with user and password
      //no logic here as it's VIEW
      viewModel.logIn(email, password);
    }
  }

  @override
  void hideLoading() {
    Navigator.pop(context);
  }

  @override
  void showLoading() {
    showDialog(context: context,
        builder: (BuildContext)=>AlertDialog(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircularProgressIndicator(),
              Text('Loading...'),
            ],
          ),
        ));
  }

  @override
  void showmessage(message) {
    showDialog(context: context,
        builder: (BuildContext)=>AlertDialog(
          content: Row(
            children: [
              Expanded(child: Text(message)),
            ],
          ),
        ));
  }

  @override
  void goToHome() {
    // TODO: implement goToHome
    Navigator.pushReplacementNamed(context,HomeScreen.routeName);
  }
}
