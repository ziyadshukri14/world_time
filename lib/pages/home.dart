//import 'dart:html';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    var modalRoute = ModalRoute.of(context);
    if (modalRoute != null) {
      data = data.isNotEmpty
          ? data
          : modalRoute.settings.arguments as Map<String, dynamic>;
    }
    print(data);

    //set background
    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )),
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
                  child: Column(
                    children: <Widget>[
                      TextButton.icon(
                        onPressed: () async {
                          dynamic result =
                              await Navigator.pushNamed(context, '/location');
                          setState(() {
                            data = {
                              'time': result['time'],
                              'location': result['location'],
                              'isDayTime': result['isDayTime'],
                              'flag': result['flag']
                            };
                          });
                        },
                        icon: Icon(
                          Icons.edit_location,
                          color: Colors.grey[600],
                        ),
                        label: Text(
                          'Edit Location',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(data['location'],
                              style: TextStyle(
                                fontSize: 28.0,
                                letterSpacing: 2.0,
                                color: Colors.white,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        data['time'],
                        style: TextStyle(
                          fontSize: 66.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ))),
        ));
  }
}
