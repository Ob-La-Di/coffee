import 'package:coffee/models/BrewingMethod.dart';
import 'package:flutter/material.dart';


class RecipeScreen extends StatefulWidget {
  final BrewingMethod method;

  RecipeScreen({Key key, @required this.method}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RecipeState(method);
}

class RecipeState extends State<RecipeScreen> {
  String _currentStep;

  int currentStepIndex = 0;
  final BrewingMethod method;

  RecipeState(this.method) {
    _currentStep = this.method.recipe[currentStepIndex].title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('${method.title}')),
        body: Column(children: <Widget>[
          Text(_currentStep),
          RaisedButton(
              child: Text('Prochaine étape'),
              onPressed: () {
                if (method.recipe.length > currentStepIndex + 1) {
                  setState(() {
                    currentStepIndex++;
                    _currentStep = this.method.recipe[currentStepIndex].title;
                  });

                }
              })
        ]));
  }
}