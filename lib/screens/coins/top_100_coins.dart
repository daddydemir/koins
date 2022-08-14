// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:koins/apis/coins.dart';
import 'package:koins/models/top_100.dart';
import 'package:koins/screens/coins/top_100_detail.dart';

import '../../custom/size.dart';

class Top100Coin extends StatefulWidget {
  const Top100Coin({super.key});

  @override
  State<Top100Coin> createState() => _Top100CoinState();
}

class _Top100CoinState extends State<Top100Coin> {
  List<Top100Model> list = [];

  @override
  void initState() {
    super.initState();
    _getTopCoins();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top 100 Coins"),
      ),
      body: Container(
        padding: CustomSize().symetricHorizontal15.copyWith(left:1),
        child: list.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int i) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Top100Detail(coin: list[i])));
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: SizedBox(
                  width: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        shape:RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        color: Colors.red[100],
                        elevation: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            list[i].marketCapRank.toString(),
                            style: const TextStyle(color:Colors.red)
                          ),
                        ),
                      ),
                      Image.network(
                        list[i].image.toString(),
                      ),
                    ],
                  ),
                ),
                title: Text(list[i].name.toString()),
                trailing: Text("\$ " + list[i].currentPrice.toString()),
              ),
            ),
          ),
        );
      },
    );
  }

  _getTopCoins() async {
    var api = CoinApi();
    list = await api.GetTop100();
    setState(() {});
  }
}
