class Currency{

  String name;
  double rate;

  Currency({this.name, this.rate});

  Currency.fromMap(String name, double rate) {
    this.name = name;
    this.rate = rate;

  }

}