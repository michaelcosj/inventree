class Product {
  String name;
  List<String> buyer = List<String>();
  double price, cost;
  List<double> amountSold = List<double>();
  List<double> profitMade = List<double>();
  int stock;
  List<String> dateSold = List<String>();
  String dateBought;

  Product(
      {this.cost,
      this.name,
      this.price,
      this.stock,
      this.buyer,
      this.dateBought,
      this.dateSold,
      this.amountSold,
      this.profitMade});

  Product.fromMap(Map map)
      : this.buyer = map['buyer'].cast<String>(),
        this.cost = map['cost'],
        this.dateBought = map['dateBought'],
        this.dateSold = map['dateSold'].cast<String>(),
        this.name = map['name'],
        this.price = map['price'],
        this.stock = map['stock'],
        this.amountSold = map['amountSold'].cast<double>(),
        this.profitMade = map['profitMade'].cast<double>();

  Map toMap() {
    return {
      'name': this.name,
      'cost': this.cost,
      'price': this.price,
      'stock': this.stock,
      'buyer': this.buyer,
      'dateBought': this.dateBought,
      'dateSold': this.dateSold,
      'amountSold': this.amountSold,
      'profitMade': this.profitMade,
    };
  }

  double getprofit() {
    double profit = price - cost;
    return profit;
  }

  double getTotalprofit() {
    double profit = (price - cost) * stock;
    return profit;
  }
}
