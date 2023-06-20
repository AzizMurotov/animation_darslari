import 'package:animation_darslari/resize_pulse_page.dart';
import 'package:flutter/material.dart';

import 'bounce_page.dart';

class SlidePage extends StatefulWidget {
  static const String id = "slide_page";

  const SlidePage({Key? key}) : super(key: key);

  @override
  State<SlidePage> createState() => _SlidePageState();
}

class _SlidePageState extends State<SlidePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;


  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _animation = Tween<Offset>(begin: Offset.zero, end: const Offset(1.5, 0.0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.elasticIn));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
               Navigator.pushReplacementNamed(context, ResizePulsePage.id);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.amber,
            )),
        actions: [
          IconButton(
              onPressed: () {
                 Navigator.pushReplacementNamed(context, BouncePage.id);
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.amber,
              ))
        ],
        backgroundColor: Colors.purpleAccent,
        title: const Text(
          "Slide Page",
          style: TextStyle(
              color: Colors.amber, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SlideTransition(
          position: _animation,
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: FlutterLogo(
              size: 150.0,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purpleAccent,
        onPressed: () {
          _controller.forward();
        },
        child: const Icon(
          Icons.play_circle,
          color: Colors.amber,
        ),
      ),
    );
  }
}
