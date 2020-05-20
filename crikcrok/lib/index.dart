import 'package:crikcrok/NouvelleRecette/dropdown.dart';
import 'package:crikcrok/newsRecette.dart';
import 'package:crikcrok/users/connexion.dart';
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
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon( Icons.arrow_back, size: 20 , color: Colors.black),
            onPressed: () {
              Navigator.push( context,
                  MaterialPageRoute( builder: (context) => mainScreen( ) ) );
            },
          ),
          actions: <Widget>[
            IconButton(icon: Icon( Icons.person, size: 20, color: Colors.black ),
              onPressed:(){
              Navigator.push( context,
                  MaterialPageRoute( builder: (context) => LoginPageClient( ) ) );
            },),
            IconButton(icon:Icon(Icons.search, size: 20, color: Colors.black,), onPressed: null)
          ],

          title: Text(
            'Crikcrok',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),

        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                top: 10.0, right: 50.0, left: 115.0, bottom: 10.0 ),
            child: new Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  dropdown(),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}