import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

String url =
    'https://api.spoonacular.com/recipes/search?apiKey=20c3e7a771554ebdaf1684304aa570c2';

List<Recipes> allRecipesFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Recipes>.from(jsonData.map((x) => Recipes.fromJson(x)));
}

Recipes recipesFromJson(String str) {
  final jsonData = json.decode(str);
  return Recipes.fromJson(jsonData);
}

String recipesToJson(Recipes data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Recipes {
  final int recipeId;
  final String recipeName;
  final int recipeDuration;
  final List<dynamic> recipeImageUrl;

  Recipes({
    this.recipeId,
    this.recipeName,
    this.recipeDuration,
    this.recipeImageUrl,
  });

  Recipes.fromJson(Map<String, dynamic> json)
      : recipeId = json["id"],
        recipeName = json["title"],
        recipeDuration = json["readyInMinutes"],
        recipeImageUrl = json["imageUrls"];

  Map<String, dynamic> toJson() => {
        "recipeId": recipeId,
        "recipeName": recipeName,
        "recipeDuration": recipeDuration,
        "recipeImageUrl": recipeImageUrl,
      };
}

/*class Address {
  final String city;
  final List<String> streets;
 
  Address({
    this.city,
    this.streets
  });
}
 
factory Address.fromJson(Map<String, dynamic> parsedJson) {
 
  return new Address(
      city: parsedJson['city'],
      streets: parsedJson['streets'],
  );
}*/

// recipes.dart (screen)

/* @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center (
        child: Card (
          elevation: 5,
          margin: EdgeInsets.fromLTRB(20, 150, 20, 150),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Column (
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Image.network('https://www.365daysofbakingandmore.com/wp-content/uploads/2011/02/Lasagna-FEATURE.jpg'),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Italian"),
                  Text("Main dish"),
                  Text("25min")
                ],
              )
            ],
          )
        )
      )
    );
  }
}*/

// foodApi.dart
