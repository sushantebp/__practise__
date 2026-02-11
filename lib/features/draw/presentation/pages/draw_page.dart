import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:practise/features/draw/presentation/widgets/drawing_widget.dart';

@RoutePage()
class DrawPage extends StatefulWidget {
  const DrawPage({super.key});

  @override
  State<DrawPage> createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {
  List<Offset?> pointers = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        // when finger touch screen
        onPanStart: (details) {
          setState(() {
            pointers.add(details.localPosition);
          });
        },
        // when finger moves through screen
        onPanUpdate: (details) {
          setState(() {
            pointers.add(details.localPosition);
          });
        },
        //when finger is out of screen's touch or finger is lift offf
        onPanEnd: (details) {
          setState(() {
            pointers.add(null);
          });
        },
        child: CustomPaint(
          painter: DrawingWidget(pointers),
          size: Size.infinite,
        ),
      ),
    );
  }
}
