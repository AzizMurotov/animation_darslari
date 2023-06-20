import 'package:animation_darslari/3d_flip_page.dart';
import 'package:animation_darslari/slide_page.dart';
import 'package:flutter/material.dart';

class BouncePage extends StatefulWidget {
  static const String id = "bounce_page";

  const BouncePage({Key? key}) : super(key: key);

  @override
  State<BouncePage> createState() => _BouncePageState();
}

class _BouncePageState extends State<BouncePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween(
      begin: 150.0,
      end: 100.0,
    ).animate(CurvedAnimation(
        parent: _controller, curve: const Interval(0.0, 1.0, curve: Curves.elasticIn)))
      ..addStatusListener((AnimationStatus status) {
        if(status == AnimationStatus.completed){
          _controller.repeat(reverse: true);
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
              Navigator.pushReplacementNamed(context, SlidePage.id);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.amber,
            )),
        actions: [
          IconButton(
              onPressed: () {
                 Navigator.pushReplacementNamed(context, DFlipPage.id);
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.amber,
              ))
        ],
        backgroundColor: Colors.purpleAccent,
        title: const Text(
          "Bounce",
          style: TextStyle(
              color: Colors.amber, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child:AnimatedBuilder(
          animation: _animation,
          builder: (ctx,ch)=>Container(
            width: 200,
            height: 150,
            margin: EdgeInsets.only(top: _animation.value,left: 125),
            child: Image.asset("assets/images/ssst3.jpg"),
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
