import 'package:flutter/material.dart';

import '../map_template.dart';
import '../model/drag_player.dart';
import '../model/drag_target_area.dart';
import '../model/map.dart';
import 'journey_mud.dart';

class JourneyGrass extends StatefulWidget {
  const JourneyGrass({super.key});

  @override
  State<JourneyGrass> createState() => _JourneyGrassState();
}

class _JourneyGrassState extends State<JourneyGrass> {
  @override
  Widget build(BuildContext context) {
    return MapTemplate(
      dndMapModel: DndMap(
        name: "JourneyMap (RC,JM)",
        dragPlayer: dragPlayerLists,
        dragTargetArea: journeyGrassTargerAreaLists,
        map: [
          "new_map/Journey_Map(RC,JM)_Morning.png",
          "new_map/Journey_Map(RC,JM)_Day.png",
          "new_map/Journey_Map(RC,JM)_Noon.png",
          "new_map/Journey_Map(RC,JM)_Night.png",
        ],
        dragTargetDestination: [
          JourneyGrass(),
          JourneyMud(),
        ],
      ),
    );
  }
}
