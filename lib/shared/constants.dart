import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor:Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white,width: 0.5),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pinkAccent,width: 0.5),
  ),
);