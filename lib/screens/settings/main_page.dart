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
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddCoinPage()));
              },
              child: Card(
                child: ListTile(
                  trailing: SizedBox(
                    height: 50,
                    width: 50,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      color:Colors.black12,
                      child: Icon(Icons.add, color: Colors.black),
                    ),
                  ),
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
