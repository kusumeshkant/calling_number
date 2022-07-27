import 'HomePage.dart';
import 'package:flutter/material.dart';

import 'dialscreen.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  var currentindex = 0;
  int pageIndex = 0;

  final pages = [
    HomePage(),
    DialScreen()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: Container(

        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(

              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? const Icon(
                Icons.home_filled,
                color: Colors.white,
                size: 35,
              )
                  : const Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const Icon(
                Icons.work_rounded,
                color: Colors.white,
                size: 35,
              )
                  : const Icon(
                Icons.work_outline_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
