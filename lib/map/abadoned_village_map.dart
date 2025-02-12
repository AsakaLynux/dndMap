import 'package:flutter/material.dart';

import '../map_template.dart';
import '../model/drag_player.dart';
import '../model/drag_target_area.dart';
import '../model/map.dart';
import 'bridge_map.dart';
import 'cliff_mud.dart';
import 'map1.dart';

class AbadonedVillageMap extends StatefulWidget {
  const AbadonedVillageMap({super.key});

  @override
  State<AbadonedVillageMap> createState() => _AbadonedVillageMapState();
}

class _AbadonedVillageMapState extends State<AbadonedVillageMap> {
  @override
  Widget build(BuildContext context) {
    return MapTemplate(
      dndMapModel: DndMap(
        name: "Abadoned Village Map",
        dragPlayer: dragPlayerLists,
        dragTargetArea: abadonedVillageMapTargetAreaLists,
        map: [
          "new_map/Abadoned_Village_Morning.png",
          "new_map/Abadoned_Village_Day.png",
          "new_map/Abadoned_Village_Noon.png",
          "new_map/Abadoned_Village_Night.png",
        ],
        dragTargetDestination: [
          Map1(),
          BridgeMap(),
          CliffMud(),
        ],
      ),
    );
  }
}
