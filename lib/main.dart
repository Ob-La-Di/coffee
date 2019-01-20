import 'package:coffee/models/BrewingMethod.dart';
import 'package:coffee/utils/fileHelper.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(title: 'Coffee'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<BrewingMethod> _configData = new List();

  @override
  void initState() {
    parseMethods().then((result) {
      setState(() {
        _configData = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_configData == null) {
      // This is what we show while we're loading
      return new Container();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: GridView.count(
            crossAxisCount: 2,
            children: _configData.map((method) {
              return FlatButton(
                  child: Text(method.title),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeScreen(recipe: method),
                      ),
                    );
                  });
            }).toList()));
  }
}

class RecipeScreen extends StatelessWidget {
  final BrewingMethod recipe;

  RecipeScreen({Key key, @required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('${recipe.title}')));
  }
}
