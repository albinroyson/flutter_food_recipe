import 'dart:convert';
import 'respiapi.dart';
import "package:http/http.dart" as http;
import 'package:foodrecipe/views/respiapi.dart';

class respiapi {
  static Future<List<respi>> getrespi() async {
    var uri = Uri.https(
        'yummly2.p.rapidapi.com', '/feeds/list', {"limit": "18", "start": "0","tag": "list.recipe.popular"});
    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "36a6972d29msh9265327e630529cp18b8b7jsncf50fea15315",
      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });
    Map data = jsonDecode(response.body);
    List _temp = []; //temporary list
    // loop through data feed &data is in array form
    for (var i in data['feed']) {
      _temp.add(i['content']['details']); // here i is a variable
    }
    return respi.recipeFromSnapshot(_temp);
  }
}
