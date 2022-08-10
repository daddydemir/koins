import 'package:flutter/material.dart';
import '../../custom/size.dart';
import '../../models/my_coins.dart';
import '../../data/sql/local_data.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {

  var helper = DatabaseHelper();
  List<MyCoins> list = [];
  //
  @override
  void initState() {
    super.initState();
    _getMyCoin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallet"),
      ),
      body:Container(
        margin: CustomSize().symetricHorizontal15,
        child:ListView(
          children: _coinList(),
        ),
      ),
    );
  }

  void _getMyCoin() async {
    list = await helper.GetAll();
    setState((){});
  }

  _coinList(){
    List<Widget> c = [];
    for (var i = 0; i < list.length; i++){
      c.add(
        ListTile(
          leading: Text(list[i].id ?? "BTC"),
          title: Text(list[i].name ?? "Bitcoin"),
        )
      );
    }
    return c;
  }
}