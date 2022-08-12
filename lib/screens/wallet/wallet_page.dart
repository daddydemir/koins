// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import '../../custom/custom_button.dart';
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
  var _id = TextEditingController();
  var _name = TextEditingController();
  var _unit = TextEditingController();
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
      body: Container(
        margin: CustomSize().symetricHorizontal15,
        child: ListView(
          children: _coinList(context),
        ),
      ),
    );
  }

  void _getMyCoin() async {
    list = await helper.GetAll();
    setState(() {});
  }

  _coinList(BuildContext context) {
    List<Widget> c = [];
    for (var i = 0; i < list.length; i++) {
      c.add(
        ListTile(
          leading: Text(list[i].id ?? "BTC" ,),
          title: Text(list[i].name ?? "Bitcoin"),
          subtitle: Text(list[i].units.toString()),
          trailing: Container(
            height: 50,
            width: 115,
            child: Row(
              children: [
                Card(
                  color:Colors.red[100],
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed:(){
                      _delete(list[i].id ?? "");
                    },
                    icon: const Icon(Icons.delete , color:Colors.red),
                  ),
                ),
                Card(
                  color:Colors.purple[100],
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30),
                            ),
                          ),
                          builder: (context) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.8,
                              child: Padding(
                                padding: CustomSize().symetricHorizontal15,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    TextField(
                                      controller: _id,
                                      keyboardType: TextInputType.name,
                                      textInputAction: TextInputAction.next,
                                      decoration: const InputDecoration(
                                        hintText: "Conin Symbol",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    TextField(
                                      controller: _name,
                                      keyboardType: TextInputType.name,
                                      textInputAction: TextInputAction.next,
                                      decoration: const InputDecoration(
                                        hintText: "Coin Name",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    TextField(
                                      controller: _unit,
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.done,
                                      decoration: const InputDecoration(
                                          hintText: "Coin Units"),
                                    ),
                                    SizedBox(
                                      height: 50,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        _save(list[i].id ?? "");
                                      },
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
                          });
                      _getMyCoin();
                    },
                    icon: const Icon(Icons.edit, color: Colors.purple),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                  ),
                ),
              ],
            ),
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(50),
            //   color: Colors.purple[100],
            // ),
          ),
        ),
      );
    }
    return c;
  }

  void _delete(String id) async {
    await helper.Delete(id);
    _getMyCoin();
  }

  void _save(String id) async {
    var coin = MyCoins();
    coin.id = _id.text;
    coin.name = _name.text;
    coin.units = double.parse(_unit.text);
    await helper.Update(coin, id);
    Navigator.pop(context);
  }
}
