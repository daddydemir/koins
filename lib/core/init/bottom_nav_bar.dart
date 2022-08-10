import 'package:flutter/material.dart';

class MyBottomNavBar extends StatefulWidget {
  MyBottomNavBar({super.key , required this.pageIndex});

  int pageIndex;
  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {

  

  void changePage(int index) {
    setState(() {
      widget.pageIndex = index;
    });
  }

  @override
  void didUpdateWidget(covariant MyBottomNavBar oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.pageIndex == widget.pageIndex) {
      setState(() {
        oldWidget.pageIndex = widget.pageIndex;
        print("change index");
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
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
            splashColor: Colors.transparent,
            onPressed: () {
              changePage(0);
            },
            icon: widget.pageIndex == 0
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
            splashColor: Colors.transparent,
            onPressed: () {
              changePage(1);
            },
            icon: widget.pageIndex == 1
                ? const Icon(
                    Icons.wallet_outlined,
                    color: Colors.grey,
                  )
                : const Icon(Icons.wallet_outlined, color: Colors.white),
          ),
          IconButton(
              splashColor: Colors.transparent,
              onPressed: () {
                changePage(2);
              },
              icon: widget.pageIndex == 2
                  ? const Icon(
                      Icons.question_mark_outlined,
                      color: Colors.grey,
                    )
                  : const Icon(Icons.question_mark_outlined,
                      color: Colors.white)),
          IconButton(
            splashColor: Colors.transparent,
            onPressed: () {
              changePage(3);
            },
            icon: widget.pageIndex == 3
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