
class Recipe {
  final String title;
  final String type;
  final int value;

  Recipe({this.title, this.type, this.value});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(title: json['title'], type: json['type'], value: json['value']);
  }
}

class BrewingMethod {
  final String title;
  final List<Recipe> recipe;
  final String formula;


  BrewingMethod({this.title, this.recipe, this.formula});
  factory BrewingMethod.fromJson(Map<String, dynamic> json) {
    List<Recipe> recipeList = new List();
    json['recipe'].forEach((element) {
      recipeList.add(Recipe(title: element['title'], type: element['type'], value: element['value']));
    });
    return BrewingMethod(title: json["name"], recipe: recipeList, formula: json['formula']);
  }
}
