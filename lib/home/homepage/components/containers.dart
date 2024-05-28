import 'package:flutter/material.dart';

TextFormField textFormFieldDetails({required String textfind,required FormFieldValidator validatorfind,required TextInputType keyboardTypeFind,required TextEditingController controllerFind}) {
  return TextFormField(
    controller: controllerFind,
    validator: validatorfind,
    keyboardType: keyboardTypeFind,
    decoration: InputDecoration(
      border: const OutlineInputBorder(borderSide: BorderSide()),
      label: Text(textfind,style: const TextStyle(color: Colors.black45),),
      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))
    ),
  );
}