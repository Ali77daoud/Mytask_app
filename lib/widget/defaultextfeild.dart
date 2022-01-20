import 'package:flutter/material.dart';

Widget DefualTextFormFeild({
  required TextEditingController controller,
  required TextInputType input_type,
  var onSbmit,
  var onChange,
  required var validate,
  required String label,
  required Widget prifixicon,
  required var ontab,
})=> TextFormField(
  controller: controller ,
  keyboardType:input_type ,
  onFieldSubmitted: onSbmit,
  onChanged: onChange,
  onTap: ontab ,
  validator: validate,
  cursorColor: Color.fromRGBO(0, 102, 102,1),
  decoration: InputDecoration(
    
    labelText: label,
    labelStyle: TextStyle(color:Color.fromRGBO(0, 102, 102,1)),
    prefixIcon: prifixicon,
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(0, 102, 102,1)),
    ),
  ), 
);
