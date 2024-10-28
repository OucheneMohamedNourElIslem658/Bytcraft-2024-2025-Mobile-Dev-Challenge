import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  void push(Widget destination) => Navigator.of(this).push(
    MaterialPageRoute(
      builder: (context) => destination
    )
  );

  void pop() => Navigator.of(this).pop();
}
