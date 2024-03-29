
import 'package:flutter/material.dart';
import 'package:sushi/basket_sliding_panel.dart';
import 'package:sushi/circular_container.dart';
import 'package:sushi/my_painter.dart';
import 'package:sushi/sushi.dart';

import 'carousel_slider.dart';

class SushiListPage extends StatefulWidget {
  SushiListPage({Key key}) : super(key: key);

  @override
  _SushiListPageState createState() => _SushiListPageState();
}

class _SushiListPageState extends State<SushiListPage> {
  List<Widget> _widgetsList;
  List<Sushi> _sushiList;
  List<Widget> _selectedSushiWidgetsList;
  List<Sushi> _selectedSushiList;
  int _slidingPanelCounter;

  Sushi _currentSushi;

  @override
  void initState() {
    super.initState();
    initLists();
  }

  void initLists() {
    initSushiList();
    _widgetsList = new List<Widget>();
    _sushiList.forEach((sushi) => {
          _widgetsList.add(GestureDetector(
            onDoubleTap: () {
              //This will ensure, that the clicked sushi is the one on the middle,
              //Not the one on the side
              if (sushi == _currentSushi) _addCurrentSushiToListOfWidgets();
            },
            child: Stack(
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
            ),
          ))
        });
  }

  void initSushiList() {
    // Creates two last widgets of the SlidingUpPanel (spacer and basket icon)
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
    _currentSushi = _sushiList[1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: CustomPaint(
              painter: MyPainter(),
            ),
          ),
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
          new BasketSlidingUpPanel(
              selectedSushiWidgetsList: _selectedSushiWidgetsList,
              selectedSushiList: _selectedSushiList)
        ],
      ),
    );
  }

  void _addCurrentSushiToListOfWidgets() {
    _selectedSushiList.add(_currentSushi);
    if (_selectedSushiList.length < 5) {
      setState(() {
        _selectedSushiWidgetsList.insert(
            // -2 here because there are two widgets on the right hand side of the row.
            _selectedSushiWidgetsList.length - 2,
            CircularContainer(
              child: Image.asset(
                'assets/images/${_currentSushi.path}',
              ),
            ));
      });
    } else if (_selectedSushiList.length == 5) {
      setState(() {
        _selectedSushiWidgetsList.insert(0, circularContainerCounterWidget());
      });
    } else if (_selectedSushiList.length > 5 && _slidingPanelCounter < 9) {
      setState(() {
        _slidingPanelCounter = _slidingPanelCounter + 1;
      });
      _selectedSushiWidgetsList.removeAt(0);
      _selectedSushiWidgetsList.insert(0, circularContainerCounterWidget());
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
