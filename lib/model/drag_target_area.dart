import 'package:flutter/material.dart';

Size screenSize =
    WidgetsBinding.instance.platformDispatcher.views.first.physicalSize;
double width = screenSize.width;
double height = screenSize.height;

List<List<double>> woodCutterTargetAreaLists = [
  [0, height / 2, 100, 160],
  [width - 100, height / 2 + 110, 100, 140],
  [width / 2, height - 100, 430, 100],
];

List<List<double>> map1TargetAreaLists = [
  [screenSize.width / 2 - 290, 0, 340, 100],
  [screenSize.width - 100, screenSize.height / 2 - 145, 100, 265],
  [screenSize.width / 5 + 50, screenSize.height - 100, 330, 100]
];

List<List<double>> bridgeMapTargetAreaLists = [
  [0, screenSize.height / 2 - 180, 100, 200],
  [screenSize.width / 2, screenSize.height - 100, 200, 100]
];

List<List<double>> cliffMudTargetAreaLists = [
  [screenSize.width / 2 - 220, 0, 340, 100]
];

List<List<double>> abadonedVillageMapTargetAreaLists = [
  [0, screenSize.height / 2 - 120, 100, 240],
  [screenSize.width / 2 - 180, 0, 280, 100],
  [screenSize.width / 2 - 180, screenSize.height - 100, 280, 100],
];

List<List<double>> journeyMudTargetAreaLists = [
  [0, screenSize.height / 2 - 125, 100, 265],
  [screenSize.width - 100, screenSize.height / 2 - 125, 100, 265]
];

List<List<double>> journeyGrassTargerAreaLists = [
  [0, screenSize.height / 2 - 125, 100, 285],
  [screenSize.width - 100, screenSize.height / 2 - 125, 100, 285],
];
