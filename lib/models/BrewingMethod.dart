
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


  BrewingMethod({this.title, this.recipe});
  factory BrewingMethod.fromJson(Map<String, dynamic> json) {
    List<Recipe> recipeList = new List();
    print(json['recipe'].forEach((element) {
      recipeList.add(Recipe(title: element['title'], type: element['type'], value: element['value']));
    }));
    return BrewingMethod(title: json["name"], recipe: recipeList);
  }
}
