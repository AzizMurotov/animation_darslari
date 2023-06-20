import 'package:animation_darslari/3d_flip_page.dart';
import 'package:animation_darslari/bounce_page.dart';
import 'package:animation_darslari/resize_pulse_page.dart';
import 'package:animation_darslari/slide_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AnimationPage(),
      routes:{
        AnimationPage.id:(context)=> const AnimationPage(),
        ResizePulsePage.id:(context)=> const ResizePulsePage(),
        SlidePage.id:(context)=> const SlidePage(),
        BouncePage.id:(context)=> const BouncePage(),
        DFlipPage.id:(context)=> const DFlipPage(),
      }
    );
  }
}
