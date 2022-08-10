import 'package:flutter/material.dart';

import '../settings/main_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  // ignore: prefer_final_fields
  List<Widget> _pages =  const [
    Center(child:Text("Page 0")),
    Center(child:Text("Page 1")),
    Center(child:Text("Burası ne bende bilmiyorum!")),
    MainPage(),
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_pages[pageIndex],
      bottomNavigationBar: MyNavBar(context),
    );
  }

  void changePage(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  Widget MyNavBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      height: 50,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () {
              changePage(0);
            },
            icon: pageIndex == 0
                ? const Icon(
                    Icons.home_filled,
                    color: Colors.grey,
                  )
                : const Icon(
                    Icons.home_filled,
                    color: Colors.white,
                  ),
          ),
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () {
              changePage(1);
            },
            icon: pageIndex == 1
                ? const Icon(
                    Icons.wallet_outlined,
                    color: Colors.grey,
                  )
                : const Icon(Icons.wallet_outlined, color: Colors.white),
          ),
          IconButton(
            highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onPressed: () {
                changePage(2);
              },
              icon: pageIndex == 2
                  ? const Icon(
                      Icons.question_mark_outlined,
                      color: Colors.grey,
                    )
                  : const Icon(Icons.question_mark_outlined,
                      color: Colors.white)),
          IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () {
              changePage(3);
            },
            icon: pageIndex == 3
                ? const Icon(
                    Icons.settings,
                    color: Colors.grey,
                  )
                : const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
          )
        ],
      ),
    );
  }
}
