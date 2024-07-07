

import 'package:flutter/material.dart';

Widget button({required String text}){
  return InkWell(
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(color: const Color(0XFF006B83),
      borderRadius: BorderRadius.circular(10.0),),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: Center(child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w300),)),
      ),
    ),
  );
}
