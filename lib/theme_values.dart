import 'dart:ui';
import 'package:flutter/material.dart';

/// ----  Blue Theme  ----
final bluePrimary         = Color(0xFF3F51B5);
final blueAccent          = Color(0xFFFF9800);
final blueTheme = ThemeData(
    primaryColor: bluePrimary,
    accentColor: blueAccent,
);

/// ----  Spooky Theme  ----
final spookyPrimary       = Color(0xFF000000);
final spookyAccent        = Color(0xFFBB86FC);
final spookyBackground    = Color(0xFF4A4A4A);
final spookyTheme = ThemeData(
    primaryColor: spookyPrimary,
    accentColor: spookyAccent,
    backgroundColor: spookyBackground, // Included background color for better spooky effects ;)
);

/// ----  Green Theme  ----
final greenPrimary        = Color(0xFF4CAF50);
final greenAccent         = Color(0xFF631739);
final greenTheme = ThemeData(
    primaryColor: greenPrimary,
    accentColor: greenAccent,
);

/// ----  Pink Theme  ----
final pinkPrimary         = Color(0xFFE91E63);
final pinkAccent          = Color(0xFF0C7D9C);
final pinkTheme = ThemeData(
    primaryColor: pinkPrimary,
    accentColor: pinkAccent,
);
