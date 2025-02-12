import 'package:flutter/material.dart';

import '../map_template.dart';
import '../model/drag_npc.dart';
import '../model/drag_player.dart';
import '../model/drag_target_area.dart';
import '../model/map.dart';
import 'bridge_map.dart';
import 'journey_mud.dart';
import 'map1.dart';

class WoodCutter extends StatefulWidget {
  const WoodCutter({super.key});

  @override
  State<WoodCutter> createState() => _WoodCutterState();
}

class _WoodCutterState extends State<WoodCutter> {
  @override
  Widget build(BuildContext context) {
    return MapTemplate(
      dndMapModel: DndMap(
        name: "Wood Cutter",
        map: [
          "new_map/Wood_Cutter_Morning.png",
          "new_map/Wood_Cutter_Day.png",
          "new_map/Wood_Cutter_Noon.png",
          "new_map/Wood_Cutter_Night.png",
        ],
        dragPlayer: dragPlayerLists,
        dragNpc: woodCutterDragNpcLists,
        dragTargetArea: woodCutterTargetAreaLists,
        dragTargetDestination: [
          JourneyMud(),
          BridgeMap(),
          Map1(),
        ],
      ),
    );
  }
}
