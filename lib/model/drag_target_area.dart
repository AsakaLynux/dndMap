import 'package:flutter/material.dart';

Size screenSize =
    WidgetsBinding.instance.platformDispatcher.views.first.physicalSize;
double width = screenSize.width;
double height = screenSize.height;

List<List<double>> woodCutterTargetAreaLists = [
  [0, height / 2, 100, 210],
  [width - 100, height / 2 + 60, 100, 160],
  [width / 2 - 300, height - 100, 270, 100],
];

List<List<double>> journeyMapWoavTargetAreaLists = [
  [width / 3 - 170, 0, 450, 100],
  [width - 100, height / 2 - 100, 100, 300],
  [width / 5 - 50, height - 100, 450, 100]
];

List<List<double>> bridgeMapTargetAreaLists = [
  [0, height / 3 - 50, 100, 200],
  [width - 100, height / 3 - 50, 100, 200],
  [width / 2 + 50, height - 100, 300, 100],
];

List<List<double>> cliffMapTargetAreaLists = [
  [width / 2 - 120, 0, 380, 100]
];

List<List<double>> abadonedVillageMapTargetAreaLists = [
  [0, height / 2 - 120, 100, 240],
  [width / 2 - 170, 0, 400, 100],
  [width / 2 - 170, height - 100, 400, 100],
];

List<List<double>> journeyMapJgwoTargetAreaLists = [
  [0, height / 3, 100, 265],
  [width - 100, height / 2 - 125, 100, 215]
];

List<List<double>> journeyMapRcjmTargerAreaLists = [
  [0, height / 2 - 125, 100, 285],
  [width - 100, height / 2 - 100, 100, 215],
];
