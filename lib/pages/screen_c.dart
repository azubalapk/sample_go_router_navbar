import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The third screen in the bottom navigation bar.
class ScreenC extends StatelessWidget {
  /// Constructs a [ScreenC] widget.
  const ScreenC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(4, (index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 10,
            child: Center(
              child: Text(
                'Card ${index + 1}',
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }),
      ),
    );
  }
}
