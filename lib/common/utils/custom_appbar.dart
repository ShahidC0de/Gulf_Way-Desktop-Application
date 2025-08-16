// ignore: unused_element
import 'package:flutter/material.dart';

AppBar appbar = AppBar(
  toolbarHeight: 100,
  bottom: PreferredSize(
    preferredSize: Size(double.infinity, 50),
    child: Column(),
  ),
  centerTitle: true,
  title: Padding(
    padding: const EdgeInsets.only(top: 30.0),
    child: SizedBox(
      width: double.infinity,
      height: 150,
      child: Image.asset('assets/images/gulf_logo.png', scale: 0.01),
    ),
  ),
);
