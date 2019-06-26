import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:sushi/circular_container.dart';
import 'package:sushi/sushi.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class BasketSlidingUpPanel extends StatefulWidget {
  BasketSlidingUpPanel({
    Key key,
    @required List<Widget> selectedSushiWidgetsList,
    @required List<Sushi> selectedSushiList,
  })  : selectedSushiWidgetsList = selectedSushiWidgetsList,
        selectedSushiList = selectedSushiList,
        super(key: key);

  final List<Widget> selectedSushiWidgetsList;
  final List<Sushi> selectedSushiList;

  @override
  _BasketSlidingUpPanelState createState() => _BasketSlidingUpPanelState();
}

class _BasketSlidingUpPanelState extends State<BasketSlidingUpPanel> {
  double _windowHeight;
  double _windowWidth;
  double _panelHeight;

  int _total;

  @override
  Widget build(BuildContext context) {
    _windowHeight = MediaQuery.of(context).size.height;
    _windowWidth = MediaQuery.of(context).size.width;
    _total = 0;

    //Calculate price
    widget.selectedSushiList.forEach((f) => _total = _total + f.price);

    _panelHeight = _windowHeight * 0.8;

    return SlidingUpPanel(
        panel: _getPanel(),
        panelSnapping: true,
        backdropEnabled: true,
        renderPanelSheet: false,
        backdropColor: Colors.grey,
        collapsed: _getCollapsed(),
        maxHeight: _panelHeight);
  }

  

  Container _getCollapsed() {
    return buildContainer(
        child: Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row(children: widget.selectedSushiWidgetsList),
    ));
  }

  Container buildContainer({Widget child}) {
    if (child == null) child = Container();

    return Container(
        margin: EdgeInsets.fromLTRB(8, 20, 8, 0),
        decoration: BoxDecoration(
          color: Color(0xff252525),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: child);
  }

  _getPanel() {
    return Container(
        margin: EdgeInsets.fromLTRB(8, 20, 8, 30),
        decoration: BoxDecoration(
          color: Color(0xff252525),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: _panelHeight * 0.1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: <Widget>[
                    for (var x = 0;
                        x < widget.selectedSushiWidgetsList.length;
                        x++)
                      widget.selectedSushiWidgetsList[x],
                  ]),
                ),
              ),
              Container(
                height: _panelHeight * 0.6,
                child: ListView(
                  children: <Widget>[
                    for (var x = 0; x < widget.selectedSushiList.length; x++)
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
                              CircularContainer(
                                child: Image.asset(
                                    'assets/images/${widget.selectedSushiList[x].path}'),
                                size: 65,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.selectedSushiList[x].name,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Spacer(),
                              Stack(
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
                                      widget.selectedSushiList[x].price
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white70),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 25,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          //Dont put divider after the last item
                          (x != widget.selectedSushiList.length - 1)?
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 36.0, right: 36),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ) : Container(),
                          
                          SizedBox(
                            height: 4,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 35.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(width: 3.5,),
                            Text(
                              'Total',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4,),
                        Stack(
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
                                _total.toString(),
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      FlatButton(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  gradient: Gradients.hersheys,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Gradients.hersheys.colors.first,
                                        blurRadius: 10,
                                        offset: Offset.fromDirection(3, -3))
                                  ],
                                  
                                  borderRadius: BorderRadius.circular(25)
                                  
                                  ),
                              width: _windowWidth * 0.45,
                              height: 50,
                            ),
                            Positioned.fill(
                                child: Center(
                                    child: Text(
                              'Buy',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 24, letterSpacing: 3, fontWeight: FontWeight.w600),
                            )))
                          ],
                        ),
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
