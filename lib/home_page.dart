import 'package:animation_darslari/resize_pulse_page.dart';
import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  static const String id = 'animation_page';

  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, ResizePulsePage.id);
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 30,
                color: Colors.amber,
              ))
        ],
        title: const Text(
          "Animation Page",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.amber, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Container(
            padding: EdgeInsets.all(10),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage("assets/images/ssst1.jpg"),
                fit: BoxFit.cover,
              ),
              border: Border.all(width: 10, color: Colors.white),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.play_arrow,color: Colors.amber,),
        onPressed: () {
          _controller.forward();
        },
      ),
    );
  }
}

