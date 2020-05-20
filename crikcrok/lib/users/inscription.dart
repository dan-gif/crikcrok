import 'package:crikcrok/users/connexion.dart';
import 'package:crikcrok/users/registre.dart';
import 'package:flutter/material.dart';


class SignUpClient extends StatefulWidget {
  @override
  _SignUpClientState createState() => _SignUpClientState();
}

class _SignUpClientState extends State<SignUpClient> {

  bool _isHidden = true;
  String _Email;
  String _Password;
  String _ConfPassword;
  String _Adresse;
  String _Name;
  String _LastName;
  String _Pseudo;
  String _Telephone;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFEBEE),
              Color(0xFFEF9A9A),
              Color(0xFFEF5350),
              Color(0xFFF44336),
            ],
          ),
        ),
        padding:
        EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0, bottom: 10.0),
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
            SizedBox(
              height: 15.0,
            ),
            Text(
              "S'enregistrer",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color:Colors.white70 ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: _Name,
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelText: 'Enter your Name'),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: _LastName,
                  hintStyle: TextStyle(
                    color: Colors.white70,
                    fontSize: 16.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelText: 'Enter your LastName'),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: _Pseudo,
                  hintStyle: TextStyle(
                    color: Colors.white70,
                    fontSize: 16.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelText: 'Enter your Pseudo'),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: _Email,
                  hintStyle: TextStyle(
                    color: Colors.white70,
                    fontSize: 16.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelText: 'Enter your email'),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: _Password,
                  hintStyle: TextStyle(
                    color: Colors.white70,
                    fontSize: 16.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelText: 'Enter your Password'),
              obscureText: _Password == "Password" ? _isHidden : true,
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: _ConfPassword,
                  hintStyle: TextStyle(
                    color: Colors.white70,
                    fontSize: 16.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelText: 'Enter your confirmation Password'),
              obscureText: _Password == "Password" ? _isHidden : true,
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: _Telephone,
                  hintStyle: TextStyle(
                    color: Colors.white70,
                    fontSize: 16.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelText: 'Enter your Telephone'),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: _Adresse,
                  hintStyle: TextStyle(
                    color: Colors.white70,
                    fontSize: 16.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  labelText: 'Enter your Address'),
            ),
            SizedBox(
              height: 10.0,
            ),
            buildButtonContainer(),
            SizedBox(
              height: 10.0,
            ),
            buildButtonContainer1(),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        //prefixIcon: hintText == "Email" ? Icon(Icons.email) : Icon(Icons.lock),
        suffixIcon: hintText == "Password"
            ? IconButton(
          onPressed: _toggleVisibility,
          icon: Icon(Icons.visibility_off),
        )
            : null,
      ),
      obscureText: hintText == "Password" ? _isHidden : false,
    );
  }

  Widget buildButtonContainer() {
    return Container(
      height: 56.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          gradient: LinearGradient(colors: [
            Color(0xFF73AEF5),
            Color(0xFF61A4F1),
            Color(0xFF478DE0),
            Color(0xFF398AE5),
          ], begin: Alignment.centerRight, end: Alignment.centerLeft)),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => register()));
        },
        child: Center(
          child: Text(
            "Register",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButtonContainer1() {
    return Container(
      height: 56.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          gradient: LinearGradient(
              colors: [
                Color(0xFF73AEF5),
                Color(0xFF61A4F1),
                Color(0xFF478DE0),
                Color(0xFF398AE5),
              ], begin: Alignment.centerRight, end: Alignment.centerLeft)),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPageClient()));
        },
        child: Center(
          child: Text(
            "Se Connecter",
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
