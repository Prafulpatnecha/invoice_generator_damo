import 'package:flutter/material.dart';
class PdfPage extends StatefulWidget {
  const PdfPage({super.key});

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
// 1. What is StatelessWidget?
// StatelessWidget is a concept in Flutter, a UI framework for building mobile and web
// applications, where the widget is immutable and does not change its state over time. It
// represents a widget that always renders the same output based on the given input and does not
// maintain any internal state.