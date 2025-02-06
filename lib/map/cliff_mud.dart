import 'package:flutter/material.dart';

import '../map_template.dart';
import '../model/drag_npc.dart';
import '../model/drag_player.dart';
import '../model/drag_target_area.dart';
import '../model/map.dart';
import 'abadoned_village_map.dart';

class CliffMud extends StatefulWidget {
  const CliffMud({super.key});

  @override
  State<CliffMud> createState() => _CliffMudState();
}

class _CliffMudState extends State<CliffMud> {
  @override
  Widget build(BuildContext context) {
    return MapTemplate(
      dndMapModel: DndMap(
        name: "Cliff mud",
        map: "map/cliff_mud.png",
        dragPlayer: dragPlayerLists,
        dragTargetArea: cliffMudTargetAreaLists,
        dragNpc: cliffMudDragNpcLists,
        dragTargetDestination: [AbadonedVillageMap()],
      ),
    );
  }
}
