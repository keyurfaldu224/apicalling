import 'package:apicalling/model/beer_model.dart';
import 'package:apicalling/resources/beer_api_provider.dart';

class Repository {
  Future<Beer> beerRepository() => beerApiProvider.beerApiProvider();
}

final repository = Repository();
