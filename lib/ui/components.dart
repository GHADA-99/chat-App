import 'package:flutter/material.dart';
//component 2
class DefaultTextFormField extends StatelessWidget {
  String label;
  String message;
  String input;
  //TODO:FIX ME
  //Function onChanged;
  DefaultTextFormField(this.label, this.message,this.input);
  String? validator(text) {
    if(text==null||text.trim().isEmpty){
      return message;
    }
    return null;
  }
  void onChanged(text){
    input=text;
    print(input);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontSize: 18, color: Color.fromRGBO(189, 189, 189, 1)),
        ),
      ),
    );
  }
}

class PatternBack extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Image.asset(
        'assets/images/pattern.png',
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
