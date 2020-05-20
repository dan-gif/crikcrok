import 'package:crikcrok/newsRecette.dart';
import 'package:crikcrok/users/inscription.dart';
import 'package:crikcrok/users/passwordPage.dart';
import 'package:flutter/material.dart';


class LoginPageClient extends StatefulWidget {
  LoginPageClient({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _LoginPageClientState createState() => _LoginPageClientState();
}

class _LoginPageClientState extends State<LoginPageClient> {
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  bool _isHidden = true;
  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[
              Color(0xFFFFEBEE),
              Color(0xFFEF9A9A),
              Color(0xFFEF5350),
              Color(0xFFF44336),
            ],
          ),
        ),
        padding:
        EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0, bottom: 10.0),
        child: new Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Logo',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Login',
                style: TextStyle(
                    fontSize: 37.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent),
              ),
              SizedBox(
                height: 30.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: _email,
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: 'Enter your email'),
                validator: (value) =>
                value.isEmpty ? "Email can't be empty" : null,
                onSaved: (value) => _email = value,
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: _password,
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    labelText: 'Enter your Password'),
                obscureText: _password == "Password" ? _isHidden : true,
                validator: (value) =>
                value.isEmpty ? "Password can't be empty" : null,
                onSaved: (value) => _password = value,
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => forgetPasswordPage()));
                  },
                  child: Text(
                    "Forgotten password?",
                    style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold, color: Colors.white70),
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              buildButtonContainer(),
              SizedBox(
                height: 25.0,
              ),
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have an account?",style: TextStyle(fontSize: 18.0, color: Colors.white),),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              buildButtonContainer1(),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
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
              context, MaterialPageRoute(builder: (context) => mainScreen()));
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

  Widget buildButtonContainer1() {
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
              context, MaterialPageRoute(builder: (context) => SignUpClient()));
        },
        child: Center(
          child: Text(
            "SignUp Client",
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
