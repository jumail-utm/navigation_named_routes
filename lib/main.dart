import 'package:flutter/material.dart';
import 'package:navigation_simple/models/mock_data.dart';
import 'package:navigation_simple/screens/summary.dart';
import 'package:navigation_simple/screens/details.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'flutter_navigation_simple',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        initialRoute: '/summary',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
            case '/summary':
              return MaterialPageRoute(
                builder: (context) =>
                    SummaryScreen(mockData[0].member, mockData),
              );

            case '/details':
              return MaterialPageRoute(
                builder: (context) => DetailsScreen(settings.arguments),
              );
          }
          return null;
        },
      ),
    );
