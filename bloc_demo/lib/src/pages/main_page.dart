import 'package:bloc_demo/src/pages/discovery/discovery_page.dart';
import 'package:bloc_demo/src/pages/mine/mine_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bloc_demo/src/pages/home/home_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;


  int currentIndex = 0;

  final List<BottomNavigationBarItem> bottomBarItemsList = [
    BottomNavigationBarItem(
      title: Text('热门话题'),
      icon: Icon(CupertinoIcons.book)
      ),
    BottomNavigationBarItem(
      title: Text('WidgetDemo'),
      icon: Icon(CupertinoIcons.eye),
      ),
    BottomNavigationBarItem(
      title: Text('我的'),
      icon: Icon(CupertinoIcons.person),
      )
  ];
  final List<Widget> pages = [
    Home(),
    Discovery(),
    Mine(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Home(),
        // bottomNavigationBar: BottomNavigationBar(
        //   fixedColor: Colors.black,
        //   items: bottomBarItemsList,
        //   currentIndex: currentIndex,
        //   onTap: (index){
        //     setState(() {
        //       currentIndex = index;
        //     });
        //   },
        // ),
      );
  }
}