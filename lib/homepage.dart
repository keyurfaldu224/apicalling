import 'package:flutter/material.dart';

import 'bloc/beer_bloc.dart';
import 'model/beer_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    beerBloc.beerBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Api_Calling'),
      ),
      body: StreamBuilder<Beer>(
        stream: beerBloc.beerStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data.beer.length,
            itemBuilder: (context, index) {
              final beerResponse = snapshot.data.beer[index];
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                      child: Image.network(beerResponse.imageUrl),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      beerResponse.name,
                      style: commanFontStyle(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    commanTextField(
                        keyname: 'Tagline : ', value: beerResponse.tagline),
                    commanTextField(
                        keyname: 'description : ',
                        value: beerResponse.description),
                    commanTextField(
                        keyname: 'abv : ', value: beerResponse.abv.toString()),
                    commanTextField(
                        keyname: 'target_fg : ',
                        value: beerResponse.targetFg.toString()),
                    commanTextField(
                        keyname: 'attenuation_level : ',
                        value: beerResponse.attenuationLevel.toString()),
                    commanTextField(
                        keyname: 'volume : ',
                        value: beerResponse.volume.value.toString() +
                            beerResponse.volume.unit),
                    commanTextField(
                        keyname: 'mash_temp : ',
                        value: beerResponse.method.mashTemp[0].temp.value
                                .toString() +
                            beerResponse.method.mashTemp[0].temp.unit),
                    commanTextField(
                        keyname: 'duration : ',
                        value: beerResponse.method.mashTemp[0].duration
                            .toString()),
                    commanTextField(
                        keyname: 'fermentation : ',
                        value: beerResponse.method.fermentation.temp.value
                                .toString() +
                            beerResponse.method.fermentation.temp.unit),
                    commanTextField(
                        keyname: 'Ingredients : ',
                        value: beerResponse.ingredients.malt[0].name),
                    commanTextField(
                        keyname: 'malt : ',
                        value: beerResponse.ingredients.malt[0].amount.value
                                .toString() +
                            beerResponse.ingredients.malt[0].amount.unit),
                    commanTextField(
                        keyname: 'brewers_tips : ',
                        value: beerResponse.brewersTips),
                    commanTextField(
                        keyname: 'contributed_by : ',
                        value: beerResponse.contributedBy),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget commanTextField({String keyname, String value}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          keyname,
          style: commanFontStyle(),
        ),
        Expanded(child: Text(value)),
      ],
    );
  }
}

TextStyle commanFontStyle() {
  return TextStyle(fontWeight: FontWeight.bold, fontSize: 15);
}
