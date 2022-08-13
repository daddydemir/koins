// ignore_for_file: prefer_final_fields, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:koins/custom/custom_button.dart';
import 'package:koins/custom/size.dart';
import '../../../models/my_coins.dart';
import '../../../data/sql/local_data.dart';

class AddCoinPage extends StatefulWidget {
  const AddCoinPage({super.key});

  @override
  State<AddCoinPage> createState() => _AddCoinPageState();
}

class _AddCoinPageState extends State<AddCoinPage> {
  var _symbol = TextEditingController();
  var _name = TextEditingController();
  var _unit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        title: const Text("Add Coin"),
      ),
      body: Container(
        padding: CustomSize().symetricHorizontal15.copyWith(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _coinSymbol(),
            const SizedBox(
              height: 50,
            ),
            _coinName(),
            const SizedBox(
              height: 50,
            ),
            _coinUnit(),
            const SizedBox(
              height: 50,
            ),
            TextButton(
              onPressed: _addCoin,
              child: const Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
              style: CustomButton().buttonStyle,
            ),
          ],
        ),
      ),
    );
  }

  TextField _coinUnit() {
    return TextField(
      controller: _unit,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      decoration:
          const InputDecoration(icon: Icon(Icons.add), hintText: "Coin Units"),
    );
  }

  TextField _coinName() {
    return TextField(
        controller: _name,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: "Coin Name",
          icon: Icon(Icons.currency_bitcoin_rounded),
        ));
  }

  TextField _coinSymbol() {
    return TextField(
      controller: _symbol,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          icon: Icon(Icons.currency_bitcoin_rounded), hintText: "Coin Symbol"),
    );
  }

  void _addCoin() async {
    var coin = MyCoins();
    coin.id = _symbol.text;
    coin.name = _name.text;
    coin.units = double.parse(_unit.text);
   var db = DatabaseHelper();
   await db.Insert(coin);
   _symbol.clear(); _name.clear(); _unit.clear();
  }
}
