class Product {
  String name;
  List<String> buyer = List<String>();
  double price, cost;
  int stock;
  List<String> dateSold = List<String>();
  String dateBought;

  Product({
    this.cost,
    this.name,
    this.price,
    this.stock,
    this.buyer,
    this.dateBought,
    this.dateSold,
  });

  Product.fromMap(Map map)
      : this.buyer = map['buyer'].cast<String>(),
        this.cost = map['cost'],
        this.dateBought = map['dateBought'],
        this.dateSold = map['dateSold'].cast<String>(),
        this.name = map['name'],
        this.price = map['price'],
        this.stock = map['stock'];

  Map toMap() {
    return {
      'name': this.name,
      'cost': this.cost,
      'price': this.price,
      'stock': this.stock,
      'buyer': this.buyer,
      'dateBought': this.dateBought,
      'dateSold': this.dateSold,
    };
  }

  double getprofit() {
    double profit = price - cost;
    return profit;
  }
}
