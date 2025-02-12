import 'package:flutter/material.dart';

import '../map_template.dart';
import '../model/drag_player.dart';
import '../model/drag_target_area.dart';
import '../model/map.dart';
import 'journey_grass.dart';
import 'wood_cutter.dart';

class JourneyMud extends StatefulWidget {
  const JourneyMud({super.key});

  @override
  State<JourneyMud> createState() => _JourneyMudState();
}

class _JourneyMudState extends State<JourneyMud> {
  @override
  Widget build(BuildContext context) {
    return MapTemplate(
      dndMapModel: DndMap(
        name: "Journey Map (JG,WO)",
        dragPlayer: dragPlayerLists,
        dragTargetArea: journeyMudTargetAreaLists,
        map: [
          "new_map/Journey_Map(JM,WO)_Morning.png",
          "new_map/Journey_Map(JM,WO)_Day.png",
          "new_map/Journey_Map(JM,WO)_Noon.png",
          "new_map/Journey_Map(JM,WO)_Night.png",
        ],
        dragTargetDestination: [
          JourneyGrass(),
          WoodCutter(),
        ],
      ),
    );
  }
}
