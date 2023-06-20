import 'package:animation_darslari/bounce_page.dart';
import 'package:flutter/material.dart';

class DFlipPage extends StatefulWidget {
  static const String id = "3d_flip_page";

  const DFlipPage({Key? key}) : super(key: key);

  @override
  State<DFlipPage> createState() => _DFlipPageState();
}

class _DFlipPageState extends State<DFlipPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller)
      ..addStatusListener((status) {})
      ..addStatusListener((AnimationStatus status) {
        setState(() {
          _status = status;
        });
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
              Navigator.pushReplacementNamed(context, BouncePage.id);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.amber,
            )),
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.pushReplacementNamed(context, SlidePage.id);
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.amber,
              ))
        ],
        backgroundColor: Colors.purpleAccent,
        title: const Text(
          "3D Flip",
          style: TextStyle(
              color: Colors.amber, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.002)
              ..rotateX(3.14 * _animation.value,),
            child: Container(
              color: Colors.purpleAccent,
            width: 200,
          height: 200,
          child: const Icon(Icons.accessibility,color: Colors.amber,size: 50,),
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
