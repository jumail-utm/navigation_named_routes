import 'package:flutter/material.dart';
import 'package:navigation_simple/router.dart';

import 'constants.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'flutter_navigation_simple',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        initialRoute: homeRoute,
        onGenerateRoute: createRoute,
      ),
    );
