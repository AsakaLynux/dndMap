import 'package:flutter/material.dart';

import '../map_template.dart';
import '../model/drag_player.dart';
import '../model/drag_target_area.dart';
import '../model/map.dart';
import 'abadoned_village_map.dart';
import 'wood_cutter.dart';

class JourneyMapWoav extends StatefulWidget {
  const JourneyMapWoav({super.key});

  @override
  State<JourneyMapWoav> createState() => _JourneyMapWoavState();
}

class _JourneyMapWoavState extends State<JourneyMapWoav> {
  @override
  Widget build(BuildContext context) {
    return MapTemplate(
      dndMapModel: DndMap(
        name: "Journey Map(WO,AV)",
        map: [
          "new_map/Journey_Map(WO,AV)_Morning.png",
          "new_map/Journey_Map(WO,AV)_Day.png",
          "new_map/Journey_Map(WO,AV)_Noon.png",
          "new_map/Journey_Map(WO,AV)_Night.png",
        ],
        dragPlayer: dragPlayerLists,
        dragTargetArea: journeyMapWoavTargetAreaLists,
        dragTargetDestination: [
          WoodCutter(),
          AbadonedVillageMap(),
          JourneyMapWoav(),
        ],
      ),
    );
  }
}
