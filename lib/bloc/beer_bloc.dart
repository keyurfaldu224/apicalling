import 'dart:async';

import 'package:apicalling/model/beer_model.dart';
import 'package:apicalling/repository/repository.dart';

class BeerBloc {
  StreamController beerStreamController = StreamController<Beer>();

  Stream get beerStream => beerStreamController.stream;

  Future<Beer> beerBloc() async {
    Beer beerData = await repository.beerRepository();
    beerStreamController.sink.add(beerData);
    return beerData;
  }

  void dispose() {
    beerStreamController.close();
  }
}

final beerBloc = BeerBloc();
