

import 'package:flutter/material.dart';

import '../../models/top_coins_api.dart';

class CoinDetail extends StatefulWidget {
  CoinDetail({super.key , required this.coin});

  late Item coin;

  @override
  State<CoinDetail> createState() => _CoinDetailState();
}

class _CoinDetailState extends State<CoinDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
          onPressed:(){ Navigator.pop(context);},
          highlightColor: Colors.transparent,
          splashColor:Colors.transparent,
          icon:const Icon(Icons.arrow_back_ios_outlined)
        ),
        title: Text(widget.coin.name ?? ""),
      ),
      body:Container(
        height:MediaQuery.of(context).size.height,
        child:Column(
          children: [
            SizedBox(
              height:200,
              width:MediaQuery.of(context).size.width,
              child: Image.network(
                widget.coin.large ?? "",
              ),
            ),
            Text(widget.coin.score.toString()),
          ],
        ),
      ),
    );
  }
}