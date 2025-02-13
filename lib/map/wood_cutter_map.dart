import 'package:flutter/material.dart';

import '../map_template.dart';
import '../model/drag_npc.dart';
import '../model/drag_player.dart';
import '../model/drag_target_area.dart';
import '../model/map.dart';
import 'bridge_map.dart';
import 'journey_map_jgwo.dart';
import 'journey_map_woav.dart';

class WoodCutterMap extends StatefulWidget {
  const WoodCutterMap({super.key});

  @override
  State<WoodCutterMap> createState() => _WoodCutterMapState();
}

class _WoodCutterMapState extends State<WoodCutterMap> {
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
        dragTargetArea: woodCutterMapTargetAreaLists,
        dragTargetDestination: [
          JourneyMapJgwo(),
          BridgeMap(),
          JourneyMapWoav(),
        ],
      ),
    );
  }
}
