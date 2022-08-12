import 'package:flutter/material.dart';

import '../../apis/coins.dart';
import '../../models/top_coins_api.dart';

class MainPageHome extends StatefulWidget {
  const MainPageHome({super.key});

  @override
  State<MainPageHome> createState() => _MainPageHomeState();
}

class _MainPageHomeState extends State<MainPageHome> {
  var list = <Coins>[];

  @override
  void initState() {
    super.initState();
    _getTest();
  }

  Widget _body(){
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context,int id){
        return SizedBox(
          height:MediaQuery.of(context).size.height * 0.119,
          child: Card(
            elevation: 0,
            child: ListTile(
              leading: Image.network(list[id].item!.large.toString()),
              title: Text(list[id].item!.name ?? ""),
              trailing: Text(list[id].item!.priceBtc.toString()),
            ),
          ),
        );
      },
    );
  }

   _getTest() async {
    var api = CoinApi();
    list = await api.GetTopCoins();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Top 7 Coins"),
      ),
      body:Container(
        child: list.isEmpty ? const Center(child: CircularProgressIndicator()) : _body(),
      ),
    );
  }
}