import 'package:flutter/material.dart';

import 'drag_npc.dart';
import 'drag_player.dart';

class DndMap {
  final String name;
  final List<String> map;
  final List<DragPlayer> dragPlayer;
  final List<Widget> dragTargetDestination;
  late List<List<double>> dragTargetArea;
  late List<DragNpc> dragNpc;

  DndMap({
    required this.name,
    required this.dragPlayer,
    required this.dragTargetArea,
    required this.map,
    required this.dragTargetDestination,
    List<DragNpc>? dragNpc,
  }) : dragNpc = dragNpc ?? [];
}
