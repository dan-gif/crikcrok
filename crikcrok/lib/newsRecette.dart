import 'package:crikcrok/NouvelleRecette/dropdown.dart';
import 'package:crikcrok/index.dart';
import 'package:crikcrok/NouvelleRecette/vue.dart';
import 'package:crikcrok/search.dart';
import 'package:flutter/material.dart';

class mainScreen extends StatelessWidget {
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearch = Text("utilisateur");
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, size: 20, color: Colors.black),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) =>premier()));
            },
          ),
          actions: <Widget>[
            IconButton(icon: Icon( Icons.search, size: 20, color: Colors.black, ),
              onPressed:(){
                Navigator.push( context,
                    MaterialPageRoute( builder: (context) => search( ) ) );
              },)
          ],
          centerTitle: true,
          title: Text(
            'Crikcrok',
            style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                top: 10.0, right: 20.0, left: 20.0, bottom: 10.0),
            child: new Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height:0.0,
                  ),
                  dropdown(),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextField(
                      maxLines: 10,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                        labelText: "Recette",
                        hintText: "Votre Recette",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),ActivityFormImagePicker(),
                  SizedBox(
                    height: 20,
                  ),

                  buildButtonContainer3(),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButtonContainer3() {
    return Container(
      height: 56.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          gradient: LinearGradient(colors: [
            Color(0xFF73AEF5),
            Color(0xFF61A4F1),
            Color(0xFF478DE0),
            Color(0xFF398AE5),
          ], begin: Alignment.centerRight, end: Alignment.centerLeft)),
      child: InkWell(
        child: Center(
          child: Text(
            "Poster votre Recette!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
