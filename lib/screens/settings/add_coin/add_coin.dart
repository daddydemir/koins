import 'package:flutter/material.dart';
import 'package:koins/custom/custom_button.dart';

class AddCoinPage extends StatefulWidget {
  const AddCoinPage({super.key});

  @override
  State<AddCoinPage> createState() => _AddCoinPageState();
}

class _AddCoinPageState extends State<AddCoinPage> {
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
        padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextField(
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  icon: Icon(Icons.currency_bitcoin_rounded),
                  hintText: "Coin Symbol"),
            ),
            const SizedBox(height: 50,),
            const TextField(
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: "Coin Name",
                icon: Icon(Icons.currency_bitcoin_rounded),
              )
            ),
            const SizedBox(height: 50,),
            const TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                icon: Icon(Icons.add),
                hintText:"Coin Units"
              ),
            ),
            const SizedBox(height: 50,),
            TextButton(
              onPressed: () {},
              child: Text(
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
}
