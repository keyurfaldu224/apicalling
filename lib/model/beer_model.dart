class Beer {
  List<BeerModel> beer = [];
  Beer({this.beer});
  Beer.fromJson(json) {
    Beer(
        beer: List<BeerModel>.from(
            json.map((x) => beer.add(BeerModel.fromJson(x)))));
  }
}

class BeerModel {
  int id;
  String name;
  String tagline;
  String firstBrewed;
  String description;
  String imageUrl;
  double abv;
  int ibu;
  int targetFg;
  int targetOg;
  int ebc;
  int srm;
  double ph;
  int attenuationLevel;
  Volume volume;
  Volume boilVolume;
  Method method;
  Ingredients ingredients;
  List<String> foodPairing;
  String brewersTips;
  String contributedBy;

  BeerModel({
    this.abv,
    this.attenuationLevel,
    this.boilVolume,
    this.brewersTips,
    this.contributedBy,
    this.description,
    this.ebc,
    this.firstBrewed,
    this.foodPairing,
    this.ibu,
    this.id,
    this.imageUrl,
    this.ingredients,
    this.method,
    this.name,
    this.ph,
    this.srm,
    this.tagline,
    this.targetFg,
    this.targetOg,
    this.volume,
  });

  BeerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tagline = json['tagline'];
    firstBrewed = json['first_brewed'];
    description = json['description'];
    imageUrl = json['image_url'];
    abv = json['abv'].toDouble();
    ibu = json['ibu'] != null ? json['ibu'].toInt() : null;
    targetFg = json['target_fg'];
    targetOg = json['target_og'].toInt();
    ebc = json['ebc'];
    srm = json['srm'] != null ? json['srm'].toInt() : null;
    ph = json['ph'] != null ? json['ph'].toDouble() : null;
    attenuationLevel = json['attenuation_level'].toInt();
    volume = Volume.fromJson(json['volume']);
    boilVolume = Volume.fromJson(json['boil_volume']);
    method = Method.fromJson(json['method']);
    ingredients = Ingredients.fromJson(json['ingredients']);
    foodPairing = json['food_pairing'].cast<String>();
    brewersTips = json['brewers_tips'];
    contributedBy = json['contributed_by'];
  }
}

class Volume {
  int value;
  String unit;

  Volume({this.unit, this.value});

  Volume.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    unit = json['unit'];
  }
}

class Method {
  List<MashTemp> mashTemp;
  Fermentation fermentation;
  String twist;

  Method({this.fermentation, this.mashTemp, this.twist});

  Method.fromJson(Map<String, dynamic> json) {
    mashTemp = [];
    json['mash_temp'].forEach((v) => mashTemp.add(MashTemp.fromJson(v)));
    fermentation = Fermentation.fromJson(json['fermentation']);
    twist = json['twist'];
  }
}

class MashTemp {
  Volume temp;
  int duration;

  MashTemp({this.duration, this.temp});

  MashTemp.fromJson(Map<String, dynamic> json) {
    temp = Volume.fromJson(json['temp']);
    duration = json['duration'];
  }
}

class Fermentation {
  Volume temp;

  Fermentation({this.temp});

  Fermentation.fromJson(Map<String, dynamic> json) {
    temp = Volume.fromJson(json['temp']);
  }
}

class Ingredients {
  List<Malt> malt;
  List<Hops> hops;
  String yeast;

  Ingredients({this.hops, this.malt, this.yeast});

  Ingredients.fromJson(Map<String, dynamic> json) {
    malt = [];
    json['malt'].forEach((v) => malt.add(Malt.fromJson(v)));
    hops = [];
    json['hops'].forEach((v) => hops.add(Hops.fromJson(v)));
    yeast = json['yeast'];
  }
}

class Malt {
  String name;
  Amount amount;

  Malt({this.amount, this.name});

  Malt.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount = Amount.fromJson(json['amount']);
  }
}

class Amount {
  double value;
  String unit;

  Amount({this.unit, this.value});

  Amount.fromJson(Map<String, dynamic> json) {
    value = json['value'].toDouble();
    unit = json['unit'];
  }
}

class Hops {
  String name;
  Amount amount;
  String add;
  String attribute;

  Hops({this.add, this.amount, this.attribute, this.name});

  Hops.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amount = Amount.fromJson(json['amount']);
    add = json['add'];
    attribute = json['attribute'];
  }
}
