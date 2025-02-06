import 'package:flutter/material.dart';

import '../map_template.dart';
import '../model/drag_npc.dart';
import '../model/drag_player.dart';
import '../model/drag_target_area.dart';
import '../model/map.dart';
import 'bridge_map.dart';
import 'journey_mud.dart';
import 'map1.dart';

class WoodCutterCopy extends StatefulWidget {
  const WoodCutterCopy({super.key});

  @override
  State<WoodCutterCopy> createState() => _WoodCutterCopyState();
}

class _WoodCutterCopyState extends State<WoodCutterCopy> {
  @override
  Widget build(BuildContext context) {
    return MapTemplate(
      dndMapModel: DndMap(
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
    );
  }
}
