
class MyCoins{
  String? id;
  String? name;
  double? units;

  MyCoins.fromObject(dynamic data){
    id = data["id"];
    name = data["name"];
    units = data["units"];
  }

  MyCoins();

  Map<String,Object?> ToMap(MyCoins coin){
    return {
      "id": coin.id,
      "name": coin.name,
      "units": coin.units
    };
  }

}