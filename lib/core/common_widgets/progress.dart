// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  bool hasProgress;
  Progress({required this.hasProgress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Center(
          child: hasProgress ? CircularProgressIndicator() : SizedBox.shrink()),
    );
  }
}
