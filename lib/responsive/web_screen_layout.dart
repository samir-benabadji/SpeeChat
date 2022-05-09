import 'package:flutter/material.dart';
import 'package:speechat/utils/colors.dart';
import 'package:speechat/utils/global_variable.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {
  int _page = 0;
  late PageController pageController; // for tabs animation

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        centerTitle: false,
        title: Text(
          'SpeeChat',
          style: TextStyle(
              color: Colors.indigo, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.home,
              color:
                  _page == 0 ? Theme.of(context).primaryColor : secondaryColor,
            ),
            onPressed: () => navigationTapped(0),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color:
                  _page == 1 ? Theme.of(context).primaryColor : secondaryColor,
            ),
            onPressed: () => navigationTapped(1),
          ),
          IconButton(
            icon: Icon(
              Icons.add_a_photo,
              color:
                  _page == 2 ? Theme.of(context).primaryColor : secondaryColor,
            ),
            onPressed: () => navigationTapped(2),
          ),
          IconButton(
            icon: Icon(
              Icons.favorite,
              color:
                  _page == 3 ? Theme.of(context).primaryColor : secondaryColor,
            ),
            onPressed: () => navigationTapped(3),
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color:
                  _page == 4 ? Theme.of(context).primaryColor : secondaryColor,
            ),
            onPressed: () => navigationTapped(4),
          ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        children: homeScreenItems,
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
    );
  }
}
