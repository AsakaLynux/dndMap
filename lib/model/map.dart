import 'package:flutter/material.dart';

import '../map/abadoned_village_map.dart';
import '../map/bridge_map.dart';
import '../map/cliff_mud.dart';
import '../map/journey_grass.dart';
import '../map/journey_mud.dart';
import '../map/map1.dart';
import '../map/wood_cutter.dart';
import 'drag_npc.dart';
import 'drag_player.dart';
import 'drag_target_area.dart';

class DndMap {
  final String name;
  final String map;
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

List<DndMap> dndMapList = [
  DndMap(
    name: "Wood Cutter",
    map: "map/woodcutter.png",
    dragPlayer: dragPlayerLists,
    dragNpc: woodCutterDragNpcLists,
    dragTargetArea: woodCutterTargetAreaLists,
    dragTargetDestination: [
      JourneyMud(),
      BridgeMap(),
      Map1(),
    ],
  ),
  DndMap(
    name: "map1",
    map: "map/map1.png",
    dragPlayer: dragPlayerLists,
    dragTargetArea: map1TargetAreaLists,
    dragTargetDestination: [
      WoodCutter(),
      AbadonedVillageMap(),
      const SizedBox(),
    ],
  ),
  DndMap(
    name: "Cliff mud",
    map: "map/cliff_mud.png",
    dragPlayer: dragPlayerLists,
    dragTargetArea: cliffMudTargetAreaLists,
    dragNpc: cliffMudDragNpcLists,
    dragTargetDestination: [AbadonedVillageMap()],
  ),
  DndMap(
    name: "Bridge Map",
    dragPlayer: dragPlayerLists,
    dragTargetArea: bridgeMapTargetAreaLists,
    map: "map/bridge_map.png",
    dragTargetDestination: [
      WoodCutter(),
      AbadonedVillageMap(),
    ],
  ),
  DndMap(
    name: "Abadoned Village Map",
    dragPlayer: dragPlayerLists,
    dragTargetArea: abadonedVillageMapTargetAreaLists,
    map: "map/abadoned_village.png",
    dragTargetDestination: [
      Map1(),
      BridgeMap(),
      CliffMud(),
    ],
  ),
  DndMap(
    name: "Journey Mud Map",
    dragPlayer: dragPlayerLists,
    dragTargetArea: journeyMudTargetAreaLists,
    map: "map/journey_mud.png",
    dragTargetDestination: [
      JourneyGrass(),
      JourneyMud(),
    ],
  ),
  DndMap(
    name: "Journey Grass Map",
    dragPlayer: dragPlayerLists,
    dragTargetArea: journeyGrassTargerAreaLists,
    map: "map/journey_grass.png",
    dragTargetDestination: [
      const SizedBox(),
      JourneyMud(),
    ],
  ),
];
