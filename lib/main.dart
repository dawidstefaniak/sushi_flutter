import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:sushi/circular_container.dart';
import 'carousel_slider.dart';
import 'package:sushi/sushi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _widgetsList;
  List<Sushi> _sushiList;
  List<Widget> _selectedSushiWidgetsList;
  List<Sushi> _selectedSushiList;
  int _slidingPanelCounter;

  Sushi _currentSushi;

  @override
  void initState() {
    super.initState();
    initSushiList();
    initLists();
  }

  void initSushiList() {
    _selectedSushiWidgetsList = [
      Spacer(),
      CircularContainer(
        child: Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
        color: Color(0xffc75352),
      )
    ];
    _slidingPanelCounter = 1;
    _sushiList = new List<Sushi>();
    _selectedSushiList = new List<Sushi>();
    _sushiList.add(new Sushi(
        category: 'Sushi',
        colour: Colors.red[300],
        path: 'sushi_prawn.png',
        kcal: 132,
        name: 'Prawn',
        rolls: 3,
        price: 3));
    _sushiList.add(new Sushi(
        category: 'Sushi',
        colour: Colors.red[400],
        path: 'sushi_salmon.png',
        kcal: 144,
        name: 'Salmon',
        rolls: 2,
        price: 6));
    _sushiList.add(new Sushi(
        category: 'Sushi',
        colour: Colors.red[300],
        path: 'sushi_tuna.png',
        kcal: 98,
        name: 'Tuna',
        rolls: 4,
        price: 9));
    _currentSushi = _sushiList[0];
  }

  void initLists() {
    _widgetsList = new List<Widget>();
    _sushiList.forEach((sushi) => {
          _widgetsList.add(Stack(
            children: <Widget>[
              Center(
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: sushi.colour),
                ),
              ),
              Positioned.fill(
                child: Image.asset('assets/images/${sushi.path}'),
              )
            ],
          ))
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
                CarouselSlider(
                  height: 250,
                  items: _widgetsList,
                  enableInfiniteScroll: false,
                  viewportFraction: .65,
                  initialPage: 1,
                  enlargeCenterPage: true,
                  onPageChanged: (index) => setState(() {
                        _currentSushi = _sushiList[index];
                      }),
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  _currentSushi.name,
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1),
                ),
                Text(
                  _currentSushi.category,
                  style: TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Rolls',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(_currentSushi.rolls.toString(),
                            style: TextStyle(fontSize: 22))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                      child: Container(
                          height: 30,
                          child: VerticalDivider(
                            color: Colors.grey,
                          )),
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Kcal',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(_currentSushi.kcal.toString(),
                            style: TextStyle(fontSize: 22))
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      height: 45,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.brown[200],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50, top: 6),
                        child: Stack(
                          children: <Widget>[
                            Text(
                              '£',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                _currentSushi.price.toString(),
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: 41,
                        height: 41,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Material(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.grey[100],
                              borderRadius: BorderRadius.circular(25),
                              onTap: () {
                                setState(() {
                                  _addCurrentSushiToListOfWidgets();
                                });
                              },
                              highlightColor: Colors.grey[300],
                              child: Container(
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle),
                                  child: Icon(Icons.add)),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SlidingUpPanel(
            panel: Container(),
            panelSnapping: true,
            backdropEnabled: true,
            renderPanelSheet: false,
            backdropColor: Colors.grey,
            collapsed: Container(
                margin: EdgeInsets.fromLTRB(8, 20, 8, 0),
                decoration: BoxDecoration(
                  color: Color(0xff252525),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  child: Row(children: _selectedSushiWidgetsList),
                )),
          )
        ],
      ),
    );
  }

  void _addCurrentSushiToListOfWidgets() {
    _selectedSushiList.add(_currentSushi);
    if (_selectedSushiList.length < 5) {
      _selectedSushiWidgetsList.insert(
          // -2 here because there are two widgets on the right hand side of the list. 
          _selectedSushiWidgetsList.length - 2,
          CircularContainer(
            child: Image.asset(
              'assets/images/${_currentSushi.path}',
            ),
            color: Color(0xff202020),
          ));
    } else if (_selectedSushiList.length == 5) {
      _selectedSushiWidgetsList.insert(
          0,
          circularContainerCounterWidget());
    } else if (_selectedSushiList.length > 5) {
      setState(() {
        _slidingPanelCounter = _slidingPanelCounter + 1;
      });
      _selectedSushiWidgetsList.removeAt(0);
      _selectedSushiWidgetsList.insert(
          0,
          circularContainerCounterWidget());
    }
  }

  CircularContainer circularContainerCounterWidget() {
    return CircularContainer(
          color: Color(0xff202020),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _slidingPanelCounter.toString(),
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
              Text(
                '+',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        );
  }
}
