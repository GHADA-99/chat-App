import 'package:chatting_app/ui/Login/loginScreen.dart';
import 'package:chatting_app/ui/Register/navigator.dart';
import 'package:chatting_app/ui/Register/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components.dart';

//view class
class RegisterScreen extends StatefulWidget {
  static const String routeName = 'Register Screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>implements Connector {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RegisterViewModel viewModel = RegisterViewModel();

  String firstName = '';
  String lastName = '';
  String userName = '';

  String email = '';
  String password = '';
  String message ='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator=this;
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext) => viewModel,
      child: Stack(
        children: [
         PatternBack(),
          Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text('Create Account'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   // DefaultTextFormField('E-mail address', 'message', (text){email=text;}),
                    TextFormField(
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Enter letters';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        firstName = text;
                      },
                      decoration:const InputDecoration(
                        labelText: 'first Name',
                        labelStyle:  TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(189, 189, 189, 1)),
                      ),
                    ),
                    TextFormField(
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Enter letters';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        lastName = text;
                      },
                      decoration:const InputDecoration(
                        labelText: 'lastName',
                        labelStyle:  TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(189, 189, 189, 1)),
                      ),
                    ),
                    TextFormField(
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Enter a valid user name';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        userName = text;
                      },
                      decoration:const InputDecoration(
                        labelText: 'User Name',
                        labelStyle:  TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(189, 189, 189, 1)),
                      ),
                    ),
                    TextFormField(
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Enter correct Email';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        email = text;
                      },
                      decoration:const InputDecoration(
                        labelText: 'email',
                        labelStyle:  TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(189, 189, 189, 1)),
                      ),
                    ),
                    TextFormField(
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Enter correct password';
                        }
                        return null;
                      },
                      onChanged: (text) {
                        password = text;
                      },
                      decoration: const InputDecoration(
                        labelText: 'password',
                        labelStyle:  TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(189, 189, 189, 1)),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                    ElevatedButton(

                      onPressed: () {
                         formValidator();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              'Create Account',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Icon(Icons.navigate_next),
                        ],
                      ),
                    ),
                    SizedBox(height: 24,),
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacementNamed(context, LogInScreen.routeName);
                      },
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('Already have an account'),
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

  void formValidator() {
     if (formKey.currentState?.validate() == true) {
    //create new account from firebase authentication "Logic" must included in view model class
      viewModel.register(email,password,userName,lastName,firstName);
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
  void showMessage(message) {
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
    // TODO: implement goTHome
    Navigator.pushReplacementNamed(context,LogInScreen.routeName);
  }
}
