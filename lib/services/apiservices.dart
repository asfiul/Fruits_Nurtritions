import 'dart:convert';

import 'package:fruits_nurtrition/services/model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<FruitsData>> getAllfruits() async {
    final allFruitsUrl = Uri.parse("https://www.fruityvice.com/api/fruit/all");
    var response = await http.get(allFruitsUrl);
    print(response.statusCode);
    List body = json.decode(response.body);
    List<FruitsData> allData =
        body.map((fruit) => FruitsData.fromJson(fruit)).toList();
    return allData;
  }
}
