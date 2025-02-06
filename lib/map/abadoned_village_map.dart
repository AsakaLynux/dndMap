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
        map: "map/abadoned_village.png",
        dragTargetDestination: [
          Map1(),
          BridgeMap(),
          CliffMud(),
        ],
      ),
    );
  }
}
