import 'package:flutter/material.dart';

import '../map_template.dart';
import '../model/drag_player.dart';
import '../model/drag_target_area.dart';
import '../model/map.dart';
import 'abadoned_village_map.dart';
import 'wood_cutter.dart';

class Map1 extends StatefulWidget {
  const Map1({super.key});

  @override
  State<Map1> createState() => _Map1State();
}

class _Map1State extends State<Map1> {
  @override
  Widget build(BuildContext context) {
    return MapTemplate(
      dndMapModel: DndMap(
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
    );
  }
}
