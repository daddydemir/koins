// ignore_for_file: unnecessary_this

class TopCoins {
  List<Coins>? coins;

  TopCoins({this.coins});

  TopCoins.fromJson(Map<String, dynamic> json) {
    if (json['coins'] != null) {
      coins = <Coins>[];
      json['coins'].forEach((v) {
        coins!.add(  Coins.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   Map<String, dynamic>();
    if (this.coins != null) {
      data['coins'] = this.coins!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Coins {
  Item? item;

  Coins({this.item});

  Coins.fromJson(Map<String, dynamic> json) {
    item = json['item'] != null ? Item.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   Map<String, dynamic>();
    if (this.item != null) {
      data['item'] = this.item!.toJson();
    }
    return data;
  }
}

class Item {
  String? id;
  int? coinId;
  String? name;
  String? symbol;
  int? marketCapRank;
  String? thumb;
  String? small;
  String? large;
  String? slug;
  double? priceBtc;
  int? score;

  Item(
      {this.id,
      this.coinId,
      this.name,
      this.symbol,
      this.marketCapRank,
      this.thumb,
      this.small,
      this.large,
      this.slug,
      this.priceBtc,
      this.score});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    coinId = json['coin_id'];
    name = json['name'];
    symbol = json['symbol'];
    marketCapRank = json['market_cap_rank'];
    thumb = json['thumb'];
    small = json['small'];
    large = json['large'];
    slug = json['slug'];
    priceBtc = json['price_btc'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =   Map<String, dynamic>();
    data['id'] = this.id;
    data['coin_id'] = this.coinId;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['market_cap_rank'] = this.marketCapRank;
    data['thumb'] = this.thumb;
    data['small'] = this.small;
    data['large'] = this.large;
    data['slug'] = this.slug;
    data['price_btc'] = this.priceBtc;
    data['score'] = this.score;
    return data;
  }
}
