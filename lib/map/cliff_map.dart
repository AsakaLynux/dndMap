import 'package:flutter/material.dart';

import '../map_template.dart';
import '../model/drag_npc.dart';
import '../model/drag_player.dart';
import '../model/drag_target_area.dart';
import '../model/map.dart';
import 'abadoned_village_map.dart';

class CliffMap extends StatefulWidget {
  const CliffMap({super.key});

  @override
  State<CliffMap> createState() => _CliffMapState();
}

class _CliffMapState extends State<CliffMap> {
  @override
  Widget build(BuildContext context) {
    return MapTemplate(
      dndMapModel: DndMap(
        name: "Cliff",
        map: [
          "new_map/Cliff_Morning.png",
          "new_map/Cliff_Day.png",
          "new_map/Cliff_Noon.png",
          "new_map/Cliff_Night.png",
        ],
        dragPlayer: dragPlayerLists,
        dragTargetArea: cliffMapTargetAreaLists,
        dragNpc: cliffMapDragNpcLists,
        dragTargetDestination: [AbadonedVillageMap()],
      ),
    );
  }
}
