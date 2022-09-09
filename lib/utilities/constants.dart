import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 50.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 30.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 15.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 50.0,
);

const kTextFieldDecor = InputDecoration(
  filled: true,
  fillColor: Color.fromARGB(156, 48, 58, 48),
  icon: Icon(Icons.location_city, color: Color.fromARGB(195, 46, 196, 46)),
  border: OutlineInputBorder(),
  hintText: 'Enter City',
);
