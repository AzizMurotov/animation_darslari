import 'package:animation_darslari/home_page.dart';
import 'package:animation_darslari/slide_page.dart';
import 'package:flutter/material.dart';

class ResizePulsePage extends StatefulWidget {
  static const String id = "resize_pulse_page";

  const ResizePulsePage({Key? key}) : super(key: key);

  @override
  State<ResizePulsePage> createState() => _ResizePulsePageState();
}

class _ResizePulsePageState extends State<ResizePulsePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  get status => null;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _animation = Tween<Size>(
      begin: const Size(400, 400),
      end: const Size(450, 450),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));
    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat();
      }
    });
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
              Navigator.pushReplacementNamed(context, AnimationPage.id);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.amber,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, SlidePage.id);
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.amber,
              ))
        ],
        backgroundColor: Colors.purpleAccent,
        title: const Text(
          "Resize Pulse ",
          style: TextStyle(
              color: Colors.amber, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: AnimatedBuilder(
        animation: _animation,
        builder: (ctx, ch) => Container(
          height: _animation.value.height,
          width: _animation.value.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/ssst2.jpg"))),
        ),
      )),
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

