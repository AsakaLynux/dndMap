import 'package:flutter/material.dart';

import '../map_template.dart';
import '../model/drag_player.dart';
import '../model/drag_target_area.dart';
import '../model/map.dart';
import 'journey_map_rcjm.dart';
import 'wood_cutter_map.dart';

class JourneyMapJgwo extends StatefulWidget {
  const JourneyMapJgwo({super.key});

  @override
  State<JourneyMapJgwo> createState() => _JourneyMapJgwoState();
}

class _JourneyMapJgwoState extends State<JourneyMapJgwo> {
  @override
  Widget build(BuildContext context) {
    return MapTemplate(
      dndMapModel: DndMap(
        name: "Journey Map (JG,WO)",
        dragPlayer: dragPlayerLists,
        dragTargetArea: journeyMapJgwoTargetAreaLists,
        map: [
          "new_map/Journey_Map(JM,WO)_Morning.png",
          "new_map/Journey_Map(JM,WO)_Day.png",
          "new_map/Journey_Map(JM,WO)_Noon.png",
          "new_map/Journey_Map(JM,WO)_Night.png",
        ],
        dragTargetDestination: [
          JourneyMapRcjm(),
          WoodCutterMap(),
        ],
      ),
    );
  }
}
