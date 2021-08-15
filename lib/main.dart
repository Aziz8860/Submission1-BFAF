import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:RestaurantApp/details.dart';
import 'package:RestaurantApp/listwidget.dart';
import 'shared/listitem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// Create SingleTickerProviderStateMixin
class _HomePageState extends State<HomePage> 
    with SingleTickerProviderStateMixin {

    List<ListItem> listTiles = [
      ListItem(
        "https://dicoding-restaurant-api.el.r.appspot.com/images/medium/07",
        lipsum.createWord(numWords: 6),
        lipsum.createWord(numWords: 2),
        "4.8",
      ),
      ListItem(
        "https://dicoding-restaurant-api.el.r.appspot.com/images/medium/07",
        lipsum.createWord(numWords: 6),
        lipsum.createWord(numWords: 2),
        "4.8",
      ),
      ListItem(
        "https://dicoding-restaurant-api.el.r.appspot.com/images/medium/29",
        lipsum.createWord(numWords: 6),
        lipsum.createWord(numWords: 2),
        "4.4",
      ),
      ListItem(
        "https://dicoding-restaurant-api.el.r.appspot.com/images/medium/38",
        lipsum.createWord(numWords: 6),
        lipsum.createWord(numWords: 2),
        "4.5",
      ),
      ListItem(
        "https://dicoding-restaurant-api.el.r.appspot.com/images/medium/40",
        lipsum.createWord(numWords: 6),
        lipsum.createWord(numWords: 2),
        "4.7",
      ),
      ListItem(
        "https://dicoding-restaurant-api.el.r.appspot.com/images/medium/08",
        lipsum.createWord(numWords: 6),
        lipsum.createWord(numWords: 2),
        "4.0",
      ),
      ListItem(
        "https://dicoding-restaurant-api.el.r.appspot.com/images/medium/32",
        lipsum.createWord(numWords: 6),
        lipsum.createWord(numWords: 2),
        "4.2",
      ),
      ListItem(
        "https://dicoding-restaurant-api.el.r.appspot.com/images/medium/45",
        lipsum.createWord(numWords: 6),
        lipsum.createWord(numWords: 2),
        "4.9",
      ),
    ];

  List<Tab> _tabList = [
    Tab(
      child: Text("Top"),
      ),
    Tab(
      child: Text("Popular"),
      ),
    Tab(
      child: Text("Trending"),
      ),
    Tab(
      child: Text("Editor's Choice"),
      ),
    Tab(
      child: Text("Category"),
      ),
  ];

  //Tab Controller
  late TabController _tabController;

  get picture => null;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: AppBar(
        toolbarHeight: 110.0,
        leading: IconButton(
          onPressed: () => Fluttertoast.showToast(  
            msg: "Alert: Tombol belum berfungsi", 
            fontSize: 18,
            toastLength: Toast.LENGTH_LONG,
            ),
          icon: Icon(
            Icons.menu,
            color: Colors.black,
            ),
          ),
          backgroundColor: Color(0xFFFAFAFA),
          centerTitle: true,
          title: Text(
            "Restaurant App",
            style: TextStyle(
              color: Colors.black,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            isScrollable: true,
            controller: _tabController,
            tabs: _tabList,
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              child: ListView.builder(
                itemCount: listTiles.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            item: listTiles[index],
                            tag: listTiles[index].restaurantTitle,
                          )));
                    },
                    child: listWidget(listTiles[index]),
                  );
                },
              ),
              ),
            ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(),
          ),
        ],
      )
    );
  }
}