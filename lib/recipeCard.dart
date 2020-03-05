import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:recipe_app/foodApi.dart';
import 'package:recipe_app/recipe.dart';

class RecipesScreen extends StatefulWidget {
  RecipesScreen({Key key}) : super(key: key);

  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Swiper(
      itemBuilder: (BuildContext context, int index) {
        return RecipeCard();
      },
      itemCount: 3,
      scrollDirection: Axis.vertical,
    ));
  }
}

class RecipeCard extends StatefulWidget {
  const RecipeCard({Key key}) : super(key: key);

  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  callAPI() {
    Recipes recipes = Recipes(
      recipeId: 69,
      recipeName: 'Sezdesdevet',
      recipeDuration: 69,
     // recipeImageUrl: 'imagejpg',
    );
    // createRecipes(recipes).then((response) {
    //   if (response.statusCode > 200)
    //     print(response.body);
    //   else
    //     print(response.statusCode);
    // }).catchError((error) {
    //   print('error : $error');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Recipes')),
        body: FutureBuilder<List<Recipes>>(
            future: loadRecipes(),
            builder: (context, snapshot) {
              /*callAPI();*/
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text("Error");
                }
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) => Center(
                      child: Card(
                          elevation: 5,
                          margin: EdgeInsets.fromLTRB(20, 150, 20, 150),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              // Row(
                              //   children: <Widget>[
                              //     Expanded(
                              //       child: Text(
                              //           '${snapshot.data[i].recipeImageUrl}'),
                              //     )
                              //   ],
                              // ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text('${snapshot.data[i].recipeName}'),
                                  Text('${snapshot.data[i].recipeDuration}'),
                                ],
                              )
                            ],
                          ))),
                );
              } else
                return CircularProgressIndicator();
            }));
  }
}
