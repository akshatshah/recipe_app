import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

import 'package:recipe_app/recipe.dart';

/* String apiKey = '?apiKey=20c3e7a771554ebdaf1684304aa570c2'; - TEMPORARY DISABLED*/
String url =
    'https://api.spoonacular.com/recipes/search?apiKey=20c3e7a771554ebdaf1684304aa570c2';

var client = http.Client();

//  Future<Response> _loadRecipesAsset() async {
//     return client.get('url');
//   }

Future<List<Recipes>> loadRecipes() async {
  var jsonRecipes = await client.get(url);
  final jsonResponse = json.decode(jsonRecipes.body.toString());
  List<Recipes> recipes;
  recipes = List<Recipes>.from(
      jsonResponse['results'].map((recipe) => Recipes.fromJson(recipe)));
  return recipes;
}
