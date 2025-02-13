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
        name: "Journey Map(wo,av)",
        map: [
          "new_map/Journey_Map(wo,av)_Morning.png",
          "new_map/Journey_Map(wo,av)_Day.png",
          "new_map/Journey_Map(wo,av)_Noon.png",
          "new_map/Journey_Map(wo,av)_Night.png",
        ],
        dragPlayer: dragPlayerLists,
        dragTargetArea: map1TargetAreaLists,
        dragTargetDestination: [
          WoodCutter(),
          AbadonedVillageMap(),
          Map1(),
        ],
      ),
    );
  }
}
