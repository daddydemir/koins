import 'package:flutter/material.dart';

import 'add_coin/add_coin.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children:  [
            InkWell(
              onTap:(){
                Navigator.push(context , MaterialPageRoute(builder: (context) =>  const AddCoinPage()));
              },
              child: const Card(
                child: ListTile(
                  trailing: Icon(Icons.add),
                  title: Text("Add Coin"),
                  subtitle: Text("Cüzdana yeni coin eklemek için kullanılır."),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
