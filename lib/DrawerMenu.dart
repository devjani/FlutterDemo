import 'package:flutter/material.dart';
import 'package:flutter_app_splashscreen/Utils/routeConstant.dart';
class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomeScreen extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Home", Icons.rss_feed),
    new DrawerItem("Login", Icons.account_circle),
    new DrawerItem("Profile", Icons.local_pizza),
    new DrawerItem("About Us", Icons.info)
  ];
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 1:
        return null;
//      case 0:
//        return null;// new fragment_one();
//      case 1:
//        return null;// new fragment_one();
//      case 2:
//        return null;
//      default:
//        return null;
//        return null;// new Text("Error");
    }
  }

  _onSelectItem(int index, BuildContext _context) {
    setState(() =>
        (index == 1 ? _selectedDrawerIndex = 0 : _selectedDrawerIndex = index));

    if (index == 1) {
      Navigator.of(context).popAndPushNamed(LoginTag);
    } else {
      Navigator.of(context).pop(); // close the drawer
    }
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i, context),
      ));
    }

    return new Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Jani Dev"),
              accountEmail: new Text("janidev94@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.white,
                  child: new Container(
                      width: 190.0,
                      height: 190.0,
                      decoration: new BoxDecoration(
                          //This code is for round image in Circle avatar
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new AssetImage("images/profile.png"))))),
            ),
            new Column(children: drawerOptions),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
