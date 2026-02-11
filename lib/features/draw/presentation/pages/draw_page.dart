import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:practise/features/draw/presentation/widgets/drawing_widget.dart';

@RoutePage()
class DrawPage extends StatefulWidget {
  const DrawPage({super.key});

  @override
  State<DrawPage> createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage> {
  List<Offset?> pointers = [];

  final GlobalKey _boundaryKey = GlobalKey();

  Future<void> _saveDrawing() async {
    try {
      RenderRepaintBoundary? boundary =
          _boundaryKey.currentContext?.findRenderObject()
              as RenderRepaintBoundary?;

      if (boundary != null) {
        ui.Image image = await boundary.toImage(pixelRatio: 3.0);
        var byteData = await image.toByteData(format: ui.ImageByteFormat.png);
        Uint8List pngBytes = byteData!.buffer.asUint8List();

        final directory = await getApplicationDocumentsDirectory();

        final String timestamp = DateTime.now().millisecondsSinceEpoch
            .toString();
        final File imgFile = File('${directory.path}/drawing_$timestamp.png');

        await imgFile.writeAsBytes(pngBytes);

        // Ensure the widget is still visible before showing Snackbar
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Image captured successfully! (${pngBytes.length} bytes)',
            ),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      log('Failed to save Image : $e');

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to capture image: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => _saveDrawing(),
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: GestureDetector(
        // when finger touch screen
        onPanStart: (details) {
          setState(() => pointers.add(details.localPosition));
        },
        // when finger moves through screen
        onPanUpdate: (details) {
          setState(() => pointers.add(details.localPosition));
        },
        //when finger is out of screen's touch or finger is lift off
        onPanEnd: (details) {
          setState(() => pointers.add(null));
        },
        child: RepaintBoundary(
          key: _boundaryKey,
          child: CustomPaint(
            painter: DrawingWidget(pointers),
            size: Size.infinite,
          ),
        ),
      ),
    );
  }
}
