import 'dart:convert';

import 'package:apicalling/model/beer_model.dart';
import 'package:http/http.dart' as http;

class BeerApiProvider {
  final url = 'https://api.punkapi.com/v2/beers';

  Future<Beer> beerApiProvider() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Beer.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }
}

final beerApiProvider = BeerApiProvider();
