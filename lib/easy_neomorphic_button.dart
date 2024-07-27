import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;

class NeomorphicButton extends StatefulWidget {
  const NeomorphicButton({
    super.key,
    required this.text,
    required this.icon,
    required this.iconSize,
    required this.textSize,
    required this.spacer,
  });

   final IconData icon;
  final String text;
  final double iconSize;
  final double textSize;
  final double spacer;

  @override
  State<NeomorphicButton> createState() => _NeomorphicButtonState();
}

class _NeomorphicButtonState extends State<NeomorphicButton> {
  bool _isElevated = false;

  @override
  Widget build(BuildContext context) {
    Offset offset = _isElevated ? const Offset(2, 2) : const Offset(3, 3);
    double blur = _isElevated ? 5 : 5;
    return Listener(
      onPointerDown: (event) {
        setState(() {
          _isElevated = true;
        });
      },
      onPointerUp: (event) {
        setState(() {
          _isElevated = false;
        });
      },
      child: AnimatedContainer(
           duration: const Duration(
          milliseconds: 40,
        ),
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFBEBEBE),
                offset: offset,
                blurRadius: blur,
                spreadRadius: 1,
                inset: _isElevated,
              ),
              BoxShadow(
                color: Colors.white,
                offset: -offset,
                blurRadius: blur,
                spreadRadius: 1,
                inset: _isElevated,
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              size: widget.iconSize,
              color: _isElevated ? Colors.green : Colors.indigo,
            ),
            SizedBox(
              height: widget.spacer,
            ),
            Text(
              widget.text,
              style: TextStyle(
                  fontSize: widget.textSize,
                  color: _isElevated ? Colors.green : Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
