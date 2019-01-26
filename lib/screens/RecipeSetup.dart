import 'package:coffee/screens/Recipe.dart';
import 'package:coffee/utils/mathHelper.dart';
import 'package:flutter/material.dart';
import 'package:coffee/models/BrewingMethod.dart';

class RecipeSetupScreen extends StatefulWidget {
  final BrewingMethod method;
  RecipeSetupScreen(this.method);

  @override
  _RecipeSetupState createState() => _RecipeSetupState(method);
}

class _RecipeSetupState extends State<RecipeSetupScreen> {
  final BrewingMethod method;
  int numberOfCups = 1;
  int cupVolume = 100;
  int totalVolume = 100;
  double coffeeWeight = 0;

  _RecipeSetupState(this.method);

  _buildQuantitiesList() {
    return DropdownButton(
      value: cupVolume,
      hint: Text('Select the volume of the cups'),
      items: new List<DropdownMenuItem>.generate(
          16,
          (int index) => DropdownMenuItem(
                value: 100 + index * 10,
                child: Text((100 + index * 10).toString() + ' mL'),
              )),
      onChanged: (value) {
        setState(() {
          cupVolume = value;
          totalVolume = value * ((numberOfCups != null) ? numberOfCups : 0);
          coffeeWeight = parseFormula(method.formula, totalVolume);
        });
      },
    );
  }

  _buildNumberOfCups() {
    return DropdownButton(
        value: numberOfCups,
        hint: Text('Select the number of cups you want to make'),
        items: new List<DropdownMenuItem>.generate(
            11,
            (int index) => DropdownMenuItem(
                  child: Text((index + 1).toString() +
                      ' cup' +
                      ((index > 0) ? 's' : '')),
                  value: index + 1,
                )),
        onChanged: (value) {
          setState(() {
            numberOfCups = value;
            totalVolume = value * ((cupVolume != null) ? cupVolume : 0);
            coffeeWeight = parseFormula(method.formula, totalVolume);
          });
        });
  }

  _buildTotalVolume() {
    return totalVolume > 0
        ? Text((totalVolume).toString() + ' mL of delicious coffee')
        : Container();
  }

  _buildCoffeWeight() {
    return coffeeWeight > 0 ? Text(coffeeWeight.round().toString() + ' grams of grinded beans') : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Setup')),
      body: Center(
          child: Column(
        children: <Widget>[
          _buildQuantitiesList(),
          _buildNumberOfCups(),
          _buildTotalVolume(),
          _buildCoffeWeight(),
          RaisedButton(
            child: Text("Let's go'"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeScreen(method: method),
                ),
              );
            },
          )
        ],
      )),
    );
  }
}
