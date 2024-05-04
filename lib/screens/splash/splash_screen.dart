import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';
  static Route route() {
    return MaterialPageRoute(
        builder: (Ccontext) => SplashScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () => Navigator.pushNamed(context, '/'));
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image(
            image: AssetImage('assts/images/MJ Logo 2023.png'),
            width: 125,
            height: 125,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          color: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            'MJ',
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Colors.white),
          ),
        )
      ],
    ));
  }
}
