// ignore_for_file: prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/coins_api.dart';
import '../models/top_100.dart';
import '../models/top_coins_api.dart';

class CoinApi {
  static var baseUrl = "https://api.coingecko.com/api/v3/";

  GetAllCoins() async {
    List<CoinApiModel> list = [];
    var url = Uri.parse(baseUrl + "coins/list");
    var request = await http.get(url);
    if(request.statusCode == 200) {
      var result = json.decode(utf8.decode(request.bodyBytes));
      for (var d in result) {
        list.add(CoinApiModel.fromJson(d));
      }
    }else {
      print("hata oldu");
    }
    print(list);
    return list;
  }

  GetTopCoins() async {
    List<Coins> list = [];
    var url = Uri.parse(baseUrl + "search/trending");
    var request = await http.get(url);
    if(request.statusCode == 200) {
       var result = json.decode(utf8.decode(request.bodyBytes));
       var coins = result["coins"];
      for (var d in coins) {
        list.add(Coins.fromJson(d));
      }
    }else{
      print("Network Error");
    }
    return list;
  }

  GetBtcToUsdt() async {
    int usd = 1;
    var url = Uri.parse(baseUrl + "simple/price?ids=bitcoin&vs_currencies=usd");
    var request = await http.get(url);
    if (request.statusCode == 200) {
      var result = json.decode(utf8.decode(request.bodyBytes));
      var btc = result["bitcoin"];
      usd = btc["usd"];
    }else{
      print("Network Error");
    }
    return usd;
  }

  GetTop100() async {
    List<Top100Model> list = [];
    var url = Uri.parse(baseUrl + "coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false");
    var request = await http.get(url);

    if (request.statusCode == 200){
       var result = json.decode(utf8.decode(request.bodyBytes));
       for (var i in result){
       list.add(Top100Model.fromJson(i));
       }
    }
    else{
      print("Network Error");
    }
    return list;
  }
}