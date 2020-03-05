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
      appBar: AppBar(title: Text("Recipes")),
      body: RecipeCard(),
    );
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
    return FutureBuilder<List<Recipes>>(
        future: loadRecipes(),
        builder: (context, snapshot) {
          /*callAPI();*/
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error");
            }
            return Swiper(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data.length,
              itemBuilder: (context, i) => Center(
                  child: RecipeCardItem(
                name: snapshot.data[i].recipeName,
                duration: snapshot.data[i].recipeDuration,
              )),
            );
          } else
            return CircularProgressIndicator();
        });
  }
}

class RecipeCardItem extends StatelessWidget {
  final String name;
  final int duration;
  const RecipeCardItem({
    this.name,
    this.duration,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        margin: EdgeInsets.fromLTRB(20, 150, 20, 150),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Image.network(
                      'https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(name),
                Text(duration.toString()),
              ],
            )
          ],
        ));
  }
}
