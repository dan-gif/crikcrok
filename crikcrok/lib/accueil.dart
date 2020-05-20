import 'package:crikcrok/dropdown.dart';
import 'package:crikcrok/newsRecette.dart';
import 'package:flutter/material.dart';

class premier extends StatefulWidget {
  @override
  _premierState createState() => _premierState();
}

// ignore: camel_case_types
class _premierState extends State<premier> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFF69D77),
            Color(0xFF292C36),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, size: 20),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => mainScreen()));
            },
          ),
          title: Text(
            'Nom du site/application',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Logo',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              dropdown(),
            ],
          ),
        ),
      ),
    );
  }
}
