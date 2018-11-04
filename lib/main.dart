import 'package:flutter/material.dart';

void main() => runApp(new AnimationDemo());

class AnimationDemo extends StatefulWidget {
  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo>
    with TickerProviderStateMixin {
  Animation animation1, animation2, animation3;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 250),
      vsync: this,
    );

    animation1 = Tween(begin: 275.0, end: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    animation2 = Tween(begin: 0.8, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    animation3 = Tween(begin: 8.0, end: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GestureDetector(
          onTap: () {
            if (_controller.status == AnimationStatus.completed) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          child: Transform(
            alignment: Alignment.centerLeft,
            transform: Matrix4.translationValues(animation1.value, 0.0, 0.0)
              ..scale(1.0, animation2.value),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Text('Tst'),
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(animation3.value),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// class GesturePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return GestureDetector(
//           onTap: () {
//             if(_controller.status == AnimationStatus.completed) {
//               _controller.reverse();
//             } else {
//               _controller.animateTo(300.0, curve: Curves.bounceOut);
//             }
//           },
//           child: Center(
//             child: AnimatedBuilder(
//               animation: _controller,
//               builder: (context, child) {
//                 return Transform(
//                   transform: Matrix4.translationValues(
//                     _controller.value,
//                     0.0,
//                     0.0
//                   )..scale(scale, scale),
//                   alignment: Alignment.centerLeft,
//                   child: Container(
//                     child: child,
//                     height: double.infinity,
//                     width: double.infinity,
//                   ),
//                 );
//               },
//               child: Container(
//                 color: Colors.red,
//                 constraints: BoxConstraints.expand(),
//               ),
//             ),
//           ),
//         );
//   }

// }
