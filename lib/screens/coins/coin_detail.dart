// ignore_for_file: prefer_interpolation_to_compose_strings, sort_child_properties_last, use_build_context_synchronously, prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:koins/custom/custom_button.dart';

import '../../apis/coins.dart';
import '../../custom/size.dart';
import '../../data/sql/local_data.dart';
import '../../models/my_coins.dart';
import '../../models/top_coins_api.dart';

class CoinDetail extends StatefulWidget {
  CoinDetail({super.key, required this.coin});

  late Item coin = Item();

  @override
  State<CoinDetail> createState() => _CoinDetailState();
}

class _CoinDetailState extends State<CoinDetail> {
  late int _usd = 1;
  var _unit = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getBtc();
  }

  _getBtc() async {
    var api = CoinApi();
    _usd = await api.GetBtcToUsdt();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: const Icon(Icons.arrow_back_ios_outlined)),
        title: Text(widget.coin.name ?? ""),
      ),
      body: _usd == 1
          ? const Center(child: CircularProgressIndicator())
          : Container(
              height: MediaQuery.of(context).size.height,
              padding: CustomSize().symetricHorizontal15,
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          widget.coin.large ?? "",
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.red[400],
                            ),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: () {
                              _addWallet(context);
                            },
                            icon: Icon(
                              Icons.wallet_rounded,
                              color: Colors.green[400],
                            ),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          )),
                      Align(
                        alignment: Alignment.topRight,
                        child: Card(
                          elevation: 0,
                          color: Colors.amber[100],
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              widget.coin.marketCapRank.toString(),
                              style: const TextStyle(
                                  color: Colors.amber, fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.coin.name.toString() +
                        " ( " +
                        widget.coin.symbol.toString() +
                        " )",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height:20),
                  Text(
                      "\$ " + (widget.coin.priceBtc! * _usd).toStringAsFixed(6),
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 50),
                  const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                ],
              ),
            ),
    );
  }

  _addWallet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        builder: (context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Padding(
              padding: CustomSize().symetricHorizontal15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      "Add To Wallet",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  TextField(
                    controller: _unit,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: "Units"),
                  ),
                  const SizedBox(height: 75),
                  TextButton(
                    onPressed: () async {
                      var coin = MyCoins();
                      coin.id = widget.coin.symbol;
                      coin.name = widget.coin.name;
                      coin.units = double.parse(_unit.text);
                      var db = DatabaseHelper();
                      await db.Insert(coin);
                      _unit.clear();
                      Navigator.pop(context);
                    },
                    child: Text("Save",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(color: Colors.white)),
                    style: CustomButton().buttonStyle,
                  ),
                  const SizedBox(height: 50),
                  const Text(
                      "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt"),
                ],
              ),
            ),
          );
        });
  }
}