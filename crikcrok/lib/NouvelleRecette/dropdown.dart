import 'package:crikcrok/vue/Entree/entreeFroide.dart';
import 'package:flutter/material.dart';

class dropdown extends StatefulWidget {
  @override
  _dropdownState createState() => _dropdownState();
}

class _dropdownState extends State<dropdown> {
  String value = "";
  List<DropdownMenuItem<String>> menuitems = List();
  bool disabledropdown = true;

  final entree = {
    "1": "Entree froide",
    "2": "Entree chaude",
  };
  final plat = {
    "1": "Plat froid",
    "2": "Plat chaud",
    "3": "Poisson",
  };
  final desert = {
    "1": "Gateaux",
    "2": "Desert chaude",
    "3": "Glace",
  };
  void populateentree() {
    for (String key in entree.keys) {
      menuitems.add(DropdownMenuItem<String>(
          child: Center(
            child: Text(entree[key]),
          ),
          value: entree[key]));
    }
  }

  void populateplat() {
    for (String key in plat.keys) {
      menuitems.add(DropdownMenuItem<String>(
          child: Center(
            child: Text(plat[key]),
          ),
          value: plat[key]));
    }
  }

  void populatedeset() {
    for (String key in desert.keys) {
      menuitems.add(DropdownMenuItem<String>(
          child: Center(
            child: Text(desert[key]),
          ),
          value: desert[key]));
    }
  }

  void selected(_value) {
    if (_value == "Entree") {
      menuitems = [];
      populateentree();
    } else if (_value == "Plat") {
      menuitems = [];
      populateplat();
    } else if (_value == "Desert") {
      menuitems = [];
      populatedeset();
    }
    setState(() {
      value = _value;
      disabledropdown = false;
    });
  }

  void secondselected(_value) {
    setState(() {
      value = _value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(

            padding: EdgeInsets.all(5.0),
            child: DropdownButton<String>(
              items: [
                DropdownMenuItem<String>(
                  value: "Entree",
                  child: Center(
                    child: Text("Entree"),
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "Plat",
                  child: Center(
                    child: Text("Plat"),
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "Desert",
                  child: Center(
                    child: Text("Desert"),
                  ),
                ),
              ],
              onChanged: (_value) => selected(_value),
                hint: Text("votre choix",style: TextStyle(color:Colors.black,fontSize: 20),),
                disabledHint: Text("$value"),
            ),
          ),
          DropdownButton<String>(
              items: menuitems,
              onChanged:
                  disabledropdown ? null : (_value) => secondselected(_value),
              hint: Text("$value",style: TextStyle(color:Colors.white,fontSize: 20),),
              disabledHint: Text("votre second choix",style: TextStyle(color:Colors.black,fontSize: 20),)),
          Text('$value',style: TextStyle(color:Colors.black,fontSize: 20,),),
        ],
      ),
    );
  }
}
