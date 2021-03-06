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
                id: snapshot.data[i].recipeId,
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
  final int id;
  final String name;
  final int duration;
  const RecipeCardItem({
    this.id,
    this.name,
    this.duration,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0)),
                  child: Image.network(
                      'https://spoonacular.com/recipeImages/${id.toString()}-556x370.jpg'),
                ))
              ],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      name,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey[800]),
                    ),
                  ),
                  Text(
                    '${duration.toString()} mins',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[800]),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
