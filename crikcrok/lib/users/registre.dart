import 'package:flutter/material.dart';


class register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF73AEF5),
            Color(0xFF61A4F1),
            Color(0xFF478DE0),
            Color(0xFF398AE5),
          ],
        ),
      ),
        child: Center(
          child: Text('Vous etes inscrit'),
        ),
      ),
    );
  }
}
