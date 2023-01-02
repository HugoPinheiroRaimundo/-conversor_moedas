import 'package:flutter/material.dart';

Widget buildTextField(
  String label,
  TextEditingController textController,
  Function changedText,
) {
  return TextField(
    controller: textController,
    decoration: InputDecoration(
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 5),
      ),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 5)),
      labelText: label,
      labelStyle: const TextStyle(color: Colors.black),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    ),
    style: const TextStyle(
        color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
    onChanged: (text) {
      changedText(text);
    },
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
  );
}
