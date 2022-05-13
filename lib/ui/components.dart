import 'package:flutter/material.dart';
//component 2
class DefaultTextFormField extends StatelessWidget {
  String label;
  String message;
  //TODO:FIX ME
  Function onChanged;
  DefaultTextFormField(this.label, this.message,this.onChanged);
  String? validator(text) {
    if(text==null||text.trim().isEmpty){
      return message;
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        validator: validator,
        onChanged: onChanged(),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(fontSize: 18, color: Color.fromRGBO(189, 189, 189, 1)),
        ),
      ),
    );
  }
}