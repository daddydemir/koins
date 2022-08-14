// ignore_for_file: must_be_immutable, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

import '../../custom/size.dart';
import '../../models/top_100.dart';

class Top100Detail extends StatefulWidget {
  Top100Detail({super.key, required this.coin});

  late Top100Model coin;

  @override
  State<Top100Detail> createState() => _Top100DetailState();
}

class _Top100DetailState extends State<Top100Detail> {
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
        title: Text(
          widget.coin.name.toString(),
        ),
      ),
      body: Container(
        padding: CustomSize().symetricHorizontal15,
        child: Column(children: [
          Stack(
            children: [
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.coin.image.toString(),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 17, top: 17),
                  child: Card(
                      elevation: 0,
                      color: Colors.green[100],
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          "- \$ " + widget.coin.high24h.toString(),
                          style: const TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      )),
                ),
              ),
              SizedBox(
                height: 250,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 17.0, bottom: 17),
                    child: Card(
                      elevation: 0,
                      color: Colors.red[100],
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text("- \$ " + widget.coin.low24h.toString(),
                            style: const TextStyle(color: Colors.red)),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 250,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: VerticalDivider(
                    width: 20,
                    thickness: 2,
                    color: Colors.black,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Card(
                  elevation: 0,
                  color: Colors.amber[100],
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(widget.coin.marketCapRank.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.amber, fontSize: 15)),
                  ),
                ),
              ),
            ],
          ),
          Text(widget.coin.symbol.toString(),
              style: Theme.of(context).textTheme.headline6),
          const SizedBox(height: 20),
          Text(
            "\$ " + widget.coin.currentPrice.toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ]),
      ),
    );
  }
}
