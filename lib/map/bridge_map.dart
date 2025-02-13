import 'package:flutter/material.dart';

import '../map_template.dart';
import '../model/drag_npc.dart';
import '../model/drag_player.dart';
import '../model/drag_target_area.dart';
import '../model/map.dart';
import 'abadoned_village_map.dart';
import 'wood_cutter.dart';

class BridgeMap extends StatefulWidget {
  const BridgeMap({super.key});

  @override
  State<BridgeMap> createState() => _BridgeMapState();
}

class _BridgeMapState extends State<BridgeMap> {
  @override
  Widget build(BuildContext context) {
    return MapTemplate(
      dndMapModel: DndMap(
        name: "Bridge",
        dragPlayer: dragPlayerLists,
        dragTargetArea: bridgeMapTargetAreaLists,
        dragNpc: brigDragNpcLists,
        map: [
          "new_map/Bridge(broken)_Morning.png",
          "new_map/Bridge(broken)_Day.png",
          "new_map/Bridge(broken)_Noon.png",
          "new_map/Bridge(broken)_Night.png",
        ],
        dragTargetDestination: [
          WoodCutter(),
          BridgeMap(),
          AbadonedVillageMap(),
        ],
      ),
    );
  }
}
